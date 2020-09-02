// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patrimonio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StorePatrimonio on _StorePatrimonioBase, Store {
  final _$loadStateAtom = Atom(name: '_StorePatrimonioBase.loadState');

  @override
  EnumLoadState get loadState {
    _$loadStateAtom.reportRead();
    return super.loadState;
  }

  @override
  set loadState(EnumLoadState value) {
    _$loadStateAtom.reportWrite(value, super.loadState, () {
      super.loadState = value;
    });
  }

  final _$paramAtom = Atom(name: '_StorePatrimonioBase.param');

  @override
  Patrimonio get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(Patrimonio value) {
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
  Either<Failure, Patrimonio> get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Either<Failure, Patrimonio> value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StorePatrimonioBase.reslist');

  @override
  Either<Failure, List<Patrimonio>> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(Either<Failure, List<Patrimonio>> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StorePatrimonioBase.reslistPage');

  @override
  Either<Failure, List<Patrimonio>> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(Either<Failure, List<Patrimonio>> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StorePatrimonioBase.resSave');

  @override
  Either<Failure, Patrimonio> get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Either<Failure, Patrimonio> value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$resDeleteAtom = Atom(name: '_StorePatrimonioBase.resDelete');

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

  final _$_StorePatrimonioBaseActionController =
      ActionController(name: '_StorePatrimonioBase');

  @override
  void setLoadState(EnumLoadState newState) {
    final _$actionInfo = _$_StorePatrimonioBaseActionController.startAction(
        name: '_StorePatrimonioBase.setLoadState');
    try {
      return super.setLoadState(newState);
    } finally {
      _$_StorePatrimonioBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void changePatrimonio(Patrimonio newPatrimonio) {
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
loadState: ${loadState},
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
