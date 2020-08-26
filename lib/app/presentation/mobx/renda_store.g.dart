// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreRenda on _StoreRendaBase, Store {
  final _$paramAtom = Atom(name: '_StoreRendaBase.param');

  @override
  Renda get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(Renda value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreRendaBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreRendaBase.resFind');

  @override
  Either<Failure, Renda> get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Either<Failure, Renda> value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreRendaBase.reslist');

  @override
  Either<Failure, List<Renda>> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(Either<Failure, List<Renda>> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreRendaBase.reslistPage');

  @override
  Either<Failure, List<Renda>> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(Either<Failure, List<Renda>> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreRendaBase.resSave');

  @override
  Either<Failure, Renda> get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Either<Failure, Renda> value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$resDeleteAtom = Atom(name: '_StoreRendaBase.resDelete');

  @override
  Either<Failure, void> get resDelete {
    _$resDeleteAtom.reportRead();
    return super.resDelete;
  }

  @override
  set resDelete(Either<Failure, void> value) {
    _$resDeleteAtom.reportWrite(value, super.resDelete, () {
      super.resDelete = value;
    });
  }

  final _$_StoreRendaBaseActionController =
      ActionController(name: '_StoreRendaBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreRendaBaseActionController.startAction(
        name: '_StoreRendaBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreRendaBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRenda(Renda newRenda) {
    final _$actionInfo = _$_StoreRendaBaseActionController.startAction(
        name: '_StoreRendaBase.changeRenda');
    try {
      return super.changeRenda(newRenda);
    } finally {
      _$_StoreRendaBaseActionController.endAction(_$actionInfo);
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
resSave: ${resSave},
resDelete: ${resDelete}
    ''';
  }
}
