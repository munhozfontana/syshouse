import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/patrimonio.dart';
import '../../domain/usecases/patrimonio_usecases.dart';

part 'patrimonio_store.g.dart';

class StorePatrimonio = _StorePatrimonioBase with _$StorePatrimonio;

abstract class _StorePatrimonioBase with Store {
  final FindPatrimonio findPatrimonio;
  final ListPatrimonio listPatrimonio;
  final ListPagePatrimonio listPagePatrimonio;
  final SavePatrimonio savePatrimonio;
  final DeletePatrimonio deletePatrimonio;

  @observable
  Patrimonio param = Patrimonio();

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
  void changePatrimonio(Patrimonio newPatrimonio) => {
        param = Patrimonio(
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

  void find(Patrimonio _patrimonio) async {
    resFind = await findPatrimonio(Params(patrimonio: _patrimonio));
  }

  @observable
  List<Patrimonio> reslist = [];

  void list() async {
    var result = await listPatrimonio(NoParams());
    result.fold((l) => print("FALHOOOO"), (r) => reslist = r);
  }

  @observable
  Either<Failure, List<Patrimonio>> reslistPage;

  void listPage(Pagination _pagination) async {
    reslistPage = await listPagePatrimonio(Params(pagination: _pagination));
  }

  @observable
  Either<Failure, Patrimonio> resSave;

  void save(Patrimonio _patrimonio) async {
    resSave = await savePatrimonio(Params(patrimonio: _patrimonio));
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Patrimonio _patrimonio) async {
    resDelete = await deletePatrimonio(Params(patrimonio: _patrimonio));
  }
}
