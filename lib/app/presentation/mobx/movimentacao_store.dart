import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../data/models/movimentacao_model.dart';
import '../../domain/entities/movimentacao.dart';
import '../../domain/usecases/movimentacao_usecases.dart';
import 'utils/enum_load_state.dart';

part 'movimentacao_store.g.dart';

class StoreMovimentacao = _StoreMovimentacaoBase with _$StoreMovimentacao;

abstract class _StoreMovimentacaoBase with Store {
  final FindMovimentacao findMovimentacao;
  final ListMovimentacao listMovimentacao;
  final ListPageMovimentacao listPageMovimentacao;
  final SaveMovimentacao saveMovimentacao;
  final DeleteMovimentacao deleteMovimentacao;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  MovimentacaoModel param = MovimentacaoModel();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StoreMovimentacaoBase({
    this.findMovimentacao,
    this.listMovimentacao,
    this.saveMovimentacao,
    this.listPageMovimentacao,
    this.deleteMovimentacao,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changeMovimentacao(MovimentacaoModel newMovimentacao) => {
        param = MovimentacaoModel(
          id: newMovimentacao.id ?? param.id,
          patrimonioOut: newMovimentacao.patrimonioOut ?? param.patrimonioOut,
          patrimonioIn: newMovimentacao.patrimonioIn ?? param.patrimonioIn,
          valor: newMovimentacao.valor ?? param.valor,
          data: newMovimentacao.data ?? param.data,
          obs: newMovimentacao.obs ?? param.obs,
        )
      };

  @observable
  Either<Failure, Movimentacao> resFind;

  void find(MovimentacaoModel _movimentacaoModel) async {
    setLoadState(EnumLoadState.loading);
    resFind =
        await findMovimentacao(Params(movimentacaoModel: _movimentacaoModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Movimentacao>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listMovimentacao(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Movimentacao>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPageMovimentacao(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Movimentacao> resSave;

  void save(MovimentacaoModel _movimentacaoModel) async {
    setLoadState(EnumLoadState.loading);
    resSave =
        await saveMovimentacao(Params(movimentacaoModel: _movimentacaoModel));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(MovimentacaoModel _movimentacaoModel) async {
    setLoadState(EnumLoadState.loading);
    resDelete =
        await deleteMovimentacao(Params(movimentacaoModel: _movimentacaoModel));
    setLoadState(EnumLoadState.loaded);
  }
}
