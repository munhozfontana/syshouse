import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/patrimonio_model.dart';
import '../../domain/entities/patrimonio.dart';
import '../../domain/usecases/patrimonio_usecases.dart';
import 'utils/enum_load_state.dart';

part 'patrimonio_store.g.dart';

class StorePatrimonio = _StorePatrimonioBase with _$StorePatrimonio;

abstract class _StorePatrimonioBase with Store {
  final FindPatrimonio findPatrimonio;
  final ListPatrimonio listPatrimonio;
  final ListPagePatrimonio listPagePatrimonio;
  final SavePatrimonio savePatrimonio;
  final DeletePatrimonio deletePatrimonio;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  PatrimonioModel param = PatrimonioModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePatrimonioBase({
    this.findPatrimonio,
    this.listPatrimonio,
    this.savePatrimonio,
    this.listPagePatrimonio,
    this.deletePatrimonio,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changePatrimonio(PatrimonioModel newPatrimonio) => {
        param = PatrimonioModel(
          id: newPatrimonio.id ?? param.id,
          nome: newPatrimonio.nome ?? param.nome,
          valor: newPatrimonio.valor ?? param.valor,
          dataInicio: newPatrimonio.dataInicio ?? param.dataInicio,
          dataFim: newPatrimonio.dataFim ?? param.dataFim,
          tipoPatrimonioId:
              newPatrimonio.tipoPatrimonioId ?? param.tipoPatrimonioId,
          localizacaoId: newPatrimonio.localizacaoId ?? param.localizacaoId,
        )
      };

  @observable
  Either<Failure, Patrimonio> resFind;

  void find(PatrimonioModel _patrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findPatrimonio(Params(patrimonioModel: _patrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Patrimonio>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listPatrimonio(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Patrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPagePatrimonio(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Patrimonio> resSave;

  void save(PatrimonioModel _patrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resSave = await savePatrimonio(Params(patrimonioModel: _patrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(PatrimonioModel _patrimonioModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete =
        await deletePatrimonio(Params(patrimonioModel: _patrimonioModel));
    setLoadState(EnumLoadState.loaded);
  }
}
