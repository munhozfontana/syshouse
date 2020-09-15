// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_renda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreTipoRenda on _StoreTipoRendaBase, Store {
  final _$paramAtom = Atom(name: '_StoreTipoRendaBase.param');

  @override
  TipoRendaModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(TipoRendaModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreTipoRendaBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreTipoRendaBase.resFind');

  @override
  TipoRenda get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(TipoRenda value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreTipoRendaBase.reslist');

  @override
  List<TipoRenda> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<TipoRenda> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreTipoRendaBase.reslistPage');

  @override
  List<TipoRenda> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<TipoRenda> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreTipoRendaBase.resSave');

  @override
  TipoRenda get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(TipoRenda value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreTipoRendaBaseActionController =
      ActionController(name: '_StoreTipoRendaBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreTipoRendaBaseActionController.startAction(
        name: '_StoreTipoRendaBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreTipoRendaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTipoRenda(TipoRendaModel newTipoRenda) {
    final _$actionInfo = _$_StoreTipoRendaBaseActionController.startAction(
        name: '_StoreTipoRendaBase.changeTipoRenda');
    try {
      return super.changeTipoRenda(newTipoRenda);
    } finally {
      _$_StoreTipoRendaBaseActionController.endAction(_$actionInfo);
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
