// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaStore on _PessoaStoreBase, Store {
  final _$clienteAtom = Atom(name: '_PessoaStoreBase.cliente');

  @override
  ClienteComponentModel get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ClienteComponentModel value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  @override
  String toString() {
    return '''
cliente: ${cliente}
    ''';
  }
}
