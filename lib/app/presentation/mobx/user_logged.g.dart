// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_logged.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserLogged on _UserLoggedBase, Store {
  final _$nameAtom = Atom(name: '_UserLoggedBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$_UserLoggedBaseActionController =
      ActionController(name: '_UserLoggedBase');

  @override
  void setName(String newName) {
    final _$actionInfo = _$_UserLoggedBaseActionController.startAction(
        name: '_UserLoggedBase.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_UserLoggedBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name}
    ''';
  }
}
