// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midia_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreMidia on _StoreMidiaBase, Store {
  final _$paramAtom = Atom(name: '_StoreMidiaBase.param');

  @override
  MidiaModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(MidiaModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreMidiaBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreMidiaBase.resFind');

  @override
  Midia get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Midia value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreMidiaBase.reslist');

  @override
  List<Midia> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Midia> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreMidiaBase.reslistPage');

  @override
  List<Midia> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Midia> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreMidiaBase.resSave');

  @override
  Midia get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Midia value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreMidiaBaseActionController =
      ActionController(name: '_StoreMidiaBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreMidiaBaseActionController.startAction(
        name: '_StoreMidiaBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreMidiaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMidia(MidiaModel newMidia) {
    final _$actionInfo = _$_StoreMidiaBaseActionController.startAction(
        name: '_StoreMidiaBase.changeMidia');
    try {
      return super.changeMidia(newMidia);
    } finally {
      _$_StoreMidiaBaseActionController.endAction(_$actionInfo);
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
