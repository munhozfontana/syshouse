// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socio_add_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocioAddController on _SocioAddControllerBase, Store {
  final _$lastSocioSaveAtom =
      Atom(name: '_SocioAddControllerBase.lastSocioSave');

  @override
  String get lastSocioSave {
    _$lastSocioSaveAtom.reportRead();
    return super.lastSocioSave;
  }

  @override
  set lastSocioSave(String value) {
    _$lastSocioSaveAtom.reportWrite(value, super.lastSocioSave, () {
      super.lastSocioSave = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_SocioAddControllerBase.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$salvarSocioAsyncAction =
      AsyncAction('_SocioAddControllerBase.salvarSocio');

  @override
  Future<void> salvarSocio() {
    return _$salvarSocioAsyncAction.run(() => super.salvarSocio());
  }

  @override
  String toString() {
    return '''
lastSocioSave: ${lastSocioSave}
    ''';
  }
}
