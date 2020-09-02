import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/localizacao.dart';
import '../../domain/usecases/localizacao_usecases.dart';

part 'localizacao_store.g.dart';

class StoreLocalizacao = _StoreLocalizacaoBase with _$StoreLocalizacao;

abstract class _StoreLocalizacaoBase with Store {
  final FindLocalizacao findLocalizacao;
  final ListLocalizacao listLocalizacao;
  final ListPageLocalizacao listPageLocalizacao;
  final SaveLocalizacao saveLocalizacao;
  final DeleteLocalizacao deleteLocalizacao;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Localizacao param = Localizacao();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreLocalizacaoBase({
    this.findLocalizacao,
    this.listLocalizacao,
    this.saveLocalizacao,
    this.listPageLocalizacao,
    this.deleteLocalizacao,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeLocalizacao(Localizacao newLocalizacao) => {
        param = Localizacao(
          id: newLocalizacao.id ?? param.id,
          endereco: newLocalizacao.endereco ?? param.endereco,
          bairro: newLocalizacao.bairro ?? param.bairro,
          cep: newLocalizacao.cep ?? param.cep,
          complemento: newLocalizacao.complemento ?? param.complemento,
          latitude: newLocalizacao.latitude ?? param.latitude,
          longitude: newLocalizacao.longitude ?? param.longitude,
          municipioId: newLocalizacao.municipioId ?? param.municipioId,
        )
      };

  @observable
  Either<Failure, Localizacao> resFind;

  void find(Localizacao _localizacao) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findLocalizacao(Params(localizacao: _localizacao));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Localizacao>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listLocalizacao(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Localizacao>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageLocalizacao(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Localizacao> resSave;

  void save(Localizacao _localizacao) async {
    setLoadState(EnumLoadState.loading);
    resSave = await saveLocalizacao(Params(localizacao: _localizacao));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Localizacao _localizacao) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deleteLocalizacao(Params(localizacao: _localizacao));
    setLoadState(EnumLoadState.loaded);
  }
}
