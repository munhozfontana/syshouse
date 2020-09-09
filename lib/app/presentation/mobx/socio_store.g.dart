// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StoreSocio on _StoreSocioBase, Store {
  final _$loadStateAtom = Atom(name: '_StoreSocioBase.loadState');

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

  final _$paramAtom = Atom(name: '_StoreSocioBase.param');

  @override
  SocioModel get param {
    _$paramAtom.reportRead();
    return super.param;
  }

  @override
  set param(SocioModel value) {
    _$paramAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  final _$paginationAtom = Atom(name: '_StoreSocioBase.pagination');

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

  final _$resFindAtom = Atom(name: '_StoreSocioBase.resFind');

  @override
  Either<Failure, Socio> get resFind {
    _$resFindAtom.reportRead();
    return super.resFind;
  }

  @override
  set resFind(Either<Failure, Socio> value) {
    _$resFindAtom.reportWrite(value, super.resFind, () {
      super.resFind = value;
    });
  }

  final _$reslistAtom = Atom(name: '_StoreSocioBase.reslist');

  @override
  Either<Failure, List<Socio>> get reslist {
    _$reslistAtom.reportRead();
    return super.reslist;
  }

  @override
  set reslist(Either<Failure, List<Socio>> value) {
    _$reslistAtom.reportWrite(value, super.reslist, () {
      super.reslist = value;
    });
  }

  final _$reslistPageAtom = Atom(name: '_StoreSocioBase.reslistPage');

  @override
  Either<Failure, List<Socio>> get reslistPage {
    _$reslistPageAtom.reportRead();
    return super.reslistPage;
  }

  @override
  set reslistPage(Either<Failure, List<Socio>> value) {
    _$reslistPageAtom.reportWrite(value, super.reslistPage, () {
      super.reslistPage = value;
    });
  }

  final _$resSaveAtom = Atom(name: '_StoreSocioBase.resSave');

  @override
  Either<Failure, Socio> get resSave {
    _$resSaveAtom.reportRead();
    return super.resSave;
  }

  @override
  set resSave(Either<Failure, Socio> value) {
    _$resSaveAtom.reportWrite(value, super.resSave, () {
      super.resSave = value;
    });
  }

  final _$resDeleteAtom = Atom(name: '_StoreSocioBase.resDelete');

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

  final _$_StoreSocioBaseActionController =
      ActionController(name: '_StoreSocioBase');

  @override
  void changePagination({Pagination newPagination}) {
    final _$actionInfo = _$_StoreSocioBaseActionController.startAction(
        name: '_StoreSocioBase.changePagination');
    try {
      return super.changePagination(newPagination: newPagination);
    } finally {
      _$_StoreSocioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSocio(SocioModel newSocio) {
    final _$actionInfo = _$_StoreSocioBaseActionController.startAction(
        name: '_StoreSocioBase.changeSocio');
    try {
      return super.changeSocio(newSocio);
    } finally {
      _$_StoreSocioBaseActionController.endAction(_$actionInfo);
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
