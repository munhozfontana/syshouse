// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaListController on _PessoaListControllerBase, Store {
  final _$resListSociosAtom =
      Atom(name: '_PessoaListControllerBase.resListSocios');

  @override
  List<Socio> get resListSocios {
    _$resListSociosAtom.reportRead();
    return super.resListSocios;
  }

  @override
  set resListSocios(List<Socio> value) {
    _$resListSociosAtom.reportWrite(value, super.resListSocios, () {
      super.resListSocios = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_PessoaListControllerBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$removeItemAsyncAction =
      AsyncAction('_PessoaListControllerBase.removeItem');

  @override
  Future<void> removeItem(Socio socio) {
    return _$removeItemAsyncAction.run(() => super.removeItem(socio));
  }

  @override
  String toString() {
    return '''
resListSocios: ${resListSocios}
    ''';
  }
}
