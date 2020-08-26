// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recebimento_patrimonio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreRecebimentoPatrimonio on _StoreRecebimentoPatrimonioBase, Store {
  final _$paramAtom = Atom(name: '_StoreRecebimentoPatrimonioBase.param');

  @override
  RecebimentoPatrimonio get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(RecebimentoPatrimonio value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom =
      Atom(name: '_StoreRecebimentoPatrimonioBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreRecebimentoPatrimonioBase.resFind');

  @override
  Either<Failure, RecebimentoPatrimonio> get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Either<Failure, RecebimentoPatrimonio> value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreRecebimentoPatrimonioBase.reslist');

  @override
  Either<Failure, List<RecebimentoPatrimonio>> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(Either<Failure, List<RecebimentoPatrimonio>> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom =
      Atom(name: '_StoreRecebimentoPatrimonioBase.reslistPage');

  @override
  Either<Failure, List<RecebimentoPatrimonio>> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(Either<Failure, List<RecebimentoPatrimonio>> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreRecebimentoPatrimonioBase.resSave');

  @override
  Either<Failure, RecebimentoPatrimonio> get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Either<Failure, RecebimentoPatrimonio> value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$resDeleteAtom =
      Atom(name: '_StoreRecebimentoPatrimonioBase.resDelete');

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

  final _$_StoreRecebimentoPatrimonioBaseActionController =
      ActionController(name: '_StoreRecebimentoPatrimonioBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreRecebimentoPatrimonioBaseActionController
        .startAction(name: '_StoreRecebimentoPatrimonioBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreRecebimentoPatrimonioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRecebimentoPatrimonio(
      RecebimentoPatrimonio newRecebimentoPatrimonio) {
    final _$actionInfo =
        _$_StoreRecebimentoPatrimonioBaseActionController.startAction(
            name:
                '_StoreRecebimentoPatrimonioBase.changeRecebimentoPatrimonio');
    try {
      return super.changeRecebimentoPatrimonio(newRecebimentoPatrimonio);
    } finally {
      _$_StoreRecebimentoPatrimonioBaseActionController.endAction(_$actionInfo);
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
