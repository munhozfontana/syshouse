// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patrimonio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StorePatrimonio on _StorePatrimonioBase, Store {
  final _$paramAtom = Atom(name: '_StorePatrimonioBase.param');

  @override
  PatrimonioModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(PatrimonioModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StorePatrimonioBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StorePatrimonioBase.resFind');

  @override
  Patrimonio get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Patrimonio value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StorePatrimonioBase.reslist');

  @override
  List<Patrimonio> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Patrimonio> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StorePatrimonioBase.reslistPage');

  @override
  List<Patrimonio> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Patrimonio> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StorePatrimonioBase.resSave');

  @override
  Patrimonio get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Patrimonio value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StorePatrimonioBaseActionController =
      ActionController(name: '_StorePatrimonioBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StorePatrimonioBaseActionController.startAction(
        name: '_StorePatrimonioBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StorePatrimonioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePatrimonio(PatrimonioModel newPatrimonio) {
    final _$actionInfo = _$_StorePatrimonioBaseActionController.startAction(
        name: '_StorePatrimonioBase.changePatrimonio');
    try {
      return super.changePatrimonio(newPatrimonio);
    } finally {
      _$_StorePatrimonioBaseActionController.endAction(_$actionInfo);
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
