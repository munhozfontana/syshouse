// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreDespesa on _StoreDespesaBase, Store {
  final _$paramAtom = Atom(name: '_StoreDespesaBase.param');

  @override
  DespesaModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(DespesaModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreDespesaBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreDespesaBase.resFind');

  @override
  Despesa get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Despesa value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreDespesaBase.reslist');

  @override
  List<Despesa> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Despesa> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreDespesaBase.reslistPage');

  @override
  List<Despesa> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Despesa> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreDespesaBase.resSave');

  @override
  Despesa get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Despesa value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreDespesaBaseActionController =
      ActionController(name: '_StoreDespesaBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreDespesaBaseActionController.startAction(
        name: '_StoreDespesaBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreDespesaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDespesa(DespesaModel newDespesa) {
    final _$actionInfo = _$_StoreDespesaBaseActionController.startAction(
        name: '_StoreDespesaBase.changeDespesa');
    try {
      return super.changeDespesa(newDespesa);
    } finally {
      _$_StoreDespesaBaseActionController.endAction(_$actionInfo);
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
