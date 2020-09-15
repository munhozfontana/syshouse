// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_despesa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreTipoDespesa on _StoreTipoDespesaBase, Store {
  final _$paramAtom = Atom(name: '_StoreTipoDespesaBase.param');

  @override
  TipoDespesaModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(TipoDespesaModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreTipoDespesaBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreTipoDespesaBase.resFind');

  @override
  TipoDespesa get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(TipoDespesa value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreTipoDespesaBase.reslist');

  @override
  List<TipoDespesa> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<TipoDespesa> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreTipoDespesaBase.reslistPage');

  @override
  List<TipoDespesa> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<TipoDespesa> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreTipoDespesaBase.resSave');

  @override
  TipoDespesa get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(TipoDespesa value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreTipoDespesaBaseActionController =
      ActionController(name: '_StoreTipoDespesaBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreTipoDespesaBaseActionController.startAction(
        name: '_StoreTipoDespesaBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreTipoDespesaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTipoDespesa(TipoDespesaModel newTipoDespesa) {
    final _$actionInfo = _$_StoreTipoDespesaBaseActionController.startAction(
        name: '_StoreTipoDespesaBase.changeTipoDespesa');
    try {
      return super.changeTipoDespesa(newTipoDespesa);
    } finally {
      _$_StoreTipoDespesaBaseActionController.endAction(_$actionInfo);
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
