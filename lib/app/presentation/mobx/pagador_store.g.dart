// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagador_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StorePagador on _StorePagadorBase, Store {
  final _$paramAtom = Atom(name: '_StorePagadorBase.param');

  @override
  PagadorModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(PagadorModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StorePagadorBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StorePagadorBase.resFind');

  @override
  Pagador get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Pagador value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StorePagadorBase.reslist');

  @override
  List<Pagador> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Pagador> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StorePagadorBase.reslistPage');

  @override
  List<Pagador> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Pagador> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StorePagadorBase.resSave');

  @override
  Pagador get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Pagador value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StorePagadorBaseActionController =
      ActionController(name: '_StorePagadorBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StorePagadorBaseActionController.startAction(
        name: '_StorePagadorBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StorePagadorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePagador(PagadorModel newPagador) {
    final _$actionInfo = _$_StorePagadorBaseActionController.startAction(
        name: '_StorePagadorBase.changePagador');
    try {
      return super.changePagador(newPagador);
    } finally {
      _$_StorePagadorBaseActionController.endAction(_$actionInfo);
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
