// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socio_add_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocioAddController on _SocioAddControllerBase, Store {
  final _$resListPatrimonioAtom =
      Atom(name: '_SocioAddControllerBase.resListPatrimonio');

  @override
  List<Patrimonio> get resListPatrimonio {
    _$resListPatrimonioAtom.reportRead();
    return super.resListPatrimonio;
  }

  @override
  set resListPatrimonio(List<Patrimonio> value) {
    _$resListPatrimonioAtom.reportWrite(value, super.resListPatrimonio, () {
      super.resListPatrimonio = value;
    });
  }

  final _$patrimonioSelectedAtom =
      Atom(name: '_SocioAddControllerBase.patrimonioSelected');

  @override
  int get patrimonioSelected {
    _$patrimonioSelectedAtom.reportRead();
    return super.patrimonioSelected;
  }

  @override
  set patrimonioSelected(int value) {
    _$patrimonioSelectedAtom.reportWrite(value, super.patrimonioSelected, () {
      super.patrimonioSelected = value;
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

  final _$_SocioAddControllerBaseActionController =
      ActionController(name: '_SocioAddControllerBase');

  @override
  void changePatrimonioSelected(int value) {
    final _$actionInfo = _$_SocioAddControllerBaseActionController.startAction(
        name: '_SocioAddControllerBase.changePatrimonioSelected');
    try {
      return super.changePatrimonioSelected(value);
    } finally {
      _$_SocioAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resListPatrimonio: ${resListPatrimonio},
patrimonioSelected: ${patrimonioSelected}
    ''';
  }
}
