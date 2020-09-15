// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StorePagamento on _StorePagamentoBase, Store {
  final _$paramAtom = Atom(name: '_StorePagamentoBase.param');

  @override
  PagamentoModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(PagamentoModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StorePagamentoBase.pagination');

  @override
  Pagination get pagination {
    _$paginationAtom.reportRead();
    return super.pagination;
  }

  @override
  set pagination(Pagination value) {
    _$paginationAtom.reportWrite(value, super.pagination, () {
      super.pagination = value;
    });
  }

  final _$resFindAtom = Atom(name: '_StorePagamentoBase.resFind');

  @override
  Pagamento get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Pagamento value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StorePagamentoBase.reslist');

  @override
  List<Pagamento> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Pagamento> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StorePagamentoBase.reslistPage');

  @override
  List<Pagamento> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Pagamento> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StorePagamentoBase.resSave');

  @override
  Pagamento get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Pagamento value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StorePagamentoBaseActionController =
      ActionController(name: '_StorePagamentoBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StorePagamentoBaseActionController.startAction(
        name: '_StorePagamentoBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StorePagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePagamento(PagamentoModel newPagamento) {
    final _$actionInfo = _$_StorePagamentoBaseActionController.startAction(
        name: '_StorePagamentoBase.changePagamento');
    try {
      return super.changePagamento(newPagamento);
    } finally {
      _$_StorePagamentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
param: ${param},
pagination: ${pagination},
resFind: ${resFind},
reslist: ${reslist},
reslistPage: ${reslistPage},
resSave: ${resSave}
    ''';
  }
}
