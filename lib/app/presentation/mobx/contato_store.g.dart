// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreContato on _StoreContatoBase, Store {
  final _$paramAtom = Atom(name: '_StoreContatoBase.param');

  @override
  ContatoModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(ContatoModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreContatoBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreContatoBase.resFind');

  @override
  Contato get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Contato value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreContatoBase.reslist');

  @override
  List<Contato> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Contato> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreContatoBase.reslistPage');

  @override
  List<Contato> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Contato> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreContatoBase.resSave');

  @override
  Contato get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Contato value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreContatoBaseActionController =
      ActionController(name: '_StoreContatoBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreContatoBaseActionController.startAction(
        name: '_StoreContatoBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreContatoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeContato(ContatoModel newContato) {
    final _$actionInfo = _$_StoreContatoBaseActionController.startAction(
        name: '_StoreContatoBase.changeContato');
    try {
      return super.changeContato(newContato);
    } finally {
      _$_StoreContatoBaseActionController.endAction(_$actionInfo);
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
