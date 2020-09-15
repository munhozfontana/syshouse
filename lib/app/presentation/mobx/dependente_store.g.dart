// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreDependente on _StoreDependenteBase, Store {
  final _$paramAtom = Atom(name: '_StoreDependenteBase.param');

  @override
  DependenteModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(DependenteModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreDependenteBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreDependenteBase.resFind');

  @override
  Dependente get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Dependente value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreDependenteBase.reslist');

  @override
  List<Dependente> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(List<Dependente> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreDependenteBase.reslistPage');

  @override
  List<Dependente> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(List<Dependente> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreDependenteBase.resSave');

  @override
  Dependente get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Dependente value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$_StoreDependenteBaseActionController =
      ActionController(name: '_StoreDependenteBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreDependenteBaseActionController.startAction(
        name: '_StoreDependenteBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreDependenteBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDependente(DependenteModel newDependente) {
    final _$actionInfo = _$_StoreDependenteBaseActionController.startAction(
        name: '_StoreDependenteBase.changeDependente');
    try {
      return super.changeDependente(newDependente);
    } finally {
      _$_StoreDependenteBaseActionController.endAction(_$actionInfo);
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
