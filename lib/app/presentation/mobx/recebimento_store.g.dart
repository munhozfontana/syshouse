// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recebimento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreRecebimento on _StoreRecebimentoBase, Store {
  final _$paramAtom = Atom(name: '_StoreRecebimentoBase.param');

  @override
  RecebimentoModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(RecebimentoModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreRecebimentoBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreRecebimentoBase.resFind');

  @override
  Recebimento get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Recebimento value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreRecebimentoBase.reslist');

  @override
  List<Recebimento> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Recebimento> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreRecebimentoBase.reslistPage');

  @override
  List<Recebimento> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Recebimento> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreRecebimentoBase.resSave');

  @override
  Recebimento get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Recebimento value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreRecebimentoBaseActionController =
      ActionController(name: '_StoreRecebimentoBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreRecebimentoBaseActionController.startAction(
        name: '_StoreRecebimentoBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreRecebimentoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRecebimento(RecebimentoModel newRecebimento) {
    final _$actionInfo = _$_StoreRecebimentoBaseActionController.startAction(
        name: '_StoreRecebimentoBase.changeRecebimento');
    try {
      return super.changeRecebimento(newRecebimento);
    } finally {
      _$_StoreRecebimentoBaseActionController.endAction(_$actionInfo);
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
