// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreLocalizacao on _StoreLocalizacaoBase, Store {
  final _$paramAtom = Atom(name: '_StoreLocalizacaoBase.param');

  @override
  LocalizacaoModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(LocalizacaoModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreLocalizacaoBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreLocalizacaoBase.resFind');

  @override
  Localizacao get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Localizacao value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreLocalizacaoBase.reslist');

  @override
  List<Localizacao> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Localizacao> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreLocalizacaoBase.reslistPage');

  @override
  List<Localizacao> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Localizacao> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreLocalizacaoBase.resSave');

  @override
  Localizacao get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Localizacao value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreLocalizacaoBaseActionController =
      ActionController(name: '_StoreLocalizacaoBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreLocalizacaoBaseActionController.startAction(
        name: '_StoreLocalizacaoBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreLocalizacaoBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLocalizacao(LocalizacaoModel newLocalizacao) {
    final _$actionInfo = _$_StoreLocalizacaoBaseActionController.startAction(
        name: '_StoreLocalizacaoBase.changeLocalizacao');
    try {
      return super.changeLocalizacao(newLocalizacao);
    } finally {
      _$_StoreLocalizacaoBaseActionController.endAction(_$actionInfo);
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
