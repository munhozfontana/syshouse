// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_patrimonio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreTipoPatrimonio on _StoreTipoPatrimonioBase, Store {
  final _$loadStateAtom = Atom(name: '_StoreTipoPatrimonioBase.loadState');

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

  final _$paramAtom = Atom(name: '_StoreTipoPatrimonioBase.param');

  @override
  TipoPatrimonio get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(TipoPatrimonio value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreTipoPatrimonioBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreTipoPatrimonioBase.resFind');

  @override
  Either<Failure, TipoPatrimonio> get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Either<Failure, TipoPatrimonio> value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreTipoPatrimonioBase.reslist');

  @override
  Either<Failure, List<TipoPatrimonio>> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(Either<Failure, List<TipoPatrimonio>> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreTipoPatrimonioBase.reslistPage');

  @override
  Either<Failure, List<TipoPatrimonio>> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(Either<Failure, List<TipoPatrimonio>> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreTipoPatrimonioBase.resSave');

  @override
  Either<Failure, TipoPatrimonio> get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Either<Failure, TipoPatrimonio> value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$resDeleteAtom = Atom(name: '_StoreTipoPatrimonioBase.resDelete');

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

  final _$_StoreTipoPatrimonioBaseActionController =
      ActionController(name: '_StoreTipoPatrimonioBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreTipoPatrimonioBaseActionController.startAction(
        name: '_StoreTipoPatrimonioBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreTipoPatrimonioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTipoPatrimonio(TipoPatrimonio newTipoPatrimonio) {
    final _$actionInfo = _$_StoreTipoPatrimonioBaseActionController.startAction(
        name: '_StoreTipoPatrimonioBase.changeTipoPatrimonio');
    try {
      return super.changeTipoPatrimonio(newTipoPatrimonio);
    } finally {
      _$_StoreTipoPatrimonioBaseActionController.endAction(_$actionInfo);
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
