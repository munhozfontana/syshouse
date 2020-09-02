import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/mobx/utils/enum_load_state.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/params.dart';
import '../../domain/entities/pagamento.dart';
import '../../domain/usecases/pagamento_usecases.dart';

part 'pagamento_store.g.dart';

class StorePagamento = _StorePagamentoBase with _$StorePagamento;

abstract class _StorePagamentoBase with Store {
  final FindPagamento findPagamento;
  final ListPagamento listPagamento;
  final ListPagePagamento listPagePagamento;
  final SavePagamento savePagamento;
  final DeletePagamento deletePagamento;

  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  void setLoadState(EnumLoadState newState) {
    loadState = newState;
  }

  @observable
  Pagamento param = Pagamento();

  @observable
  Pagination pagination = Pagination(page: 0, size: 5);

  _StorePagamentoBase({
    this.findPagamento,
    this.listPagamento,
    this.savePagamento,
    this.listPagePagamento,
    this.deletePagamento,
  });

  @action
  void changePagination({Pagination newPagination}) {
    pagination = Pagination(
      page: newPagination.page ?? pagination.page,
      size: newPagination.size ?? pagination.size,
    );
  }

  @action
  void changePagamento(Pagamento newPagamento) => {
        param = Pagamento(
          id: newPagamento.id ?? param.id,
          despesaId: newPagamento.despesaId ?? param.despesaId,
          valor: newPagamento.valor ?? param.valor,
          dataPagamento: newPagamento.dataPagamento ?? param.dataPagamento,
          obs: newPagamento.obs ?? param.obs,
        )
      };

  @observable
  Either<Failure, Pagamento> resFind;

  void find(Pagamento _pagamento) async {
    setLoadState(EnumLoadState.loading);
    resFind = await findPagamento(Params(pagamento: _pagamento));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Pagamento>> reslist;

  void list() async {
    setLoadState(EnumLoadState.loading);
    reslist = await listPagamento(NoParams());
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, List<Pagamento>> reslistPage;

  void listPage(Pagination _pagination) async {
    setLoadState(EnumLoadState.loading);
    reslistPage = await listPagePagamento(Params(pagination: _pagination));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, Pagamento> resSave;

  void save(Pagamento _pagamento) async {
    setLoadState(EnumLoadState.loading);
    resSave = await savePagamento(Params(pagamento: _pagamento));
    setLoadState(EnumLoadState.loaded);
  }

  @observable
  Either<Failure, void> resDelete;

  void delete(Pagamento _pagamento) async {
    setLoadState(EnumLoadState.loading);
    resDelete = await deletePagamento(Params(pagamento: _pagamento));
    setLoadState(EnumLoadState.loaded);
  }
}
