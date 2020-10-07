// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa_add_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PessoaAddController on _PessoaAddControllerBase, Store {
  final _$tabControllerAtom =
      Atom(name: '_PessoaAddControllerBase.tabController');

  @override
  TabController get tabController {
    _$tabControllerAtom.reportRead();
    return super.tabController;
  }

  @override
  set tabController(TabController value) {
    _$tabControllerAtom.reportWrite(value, super.tabController, () {
      super.tabController = value;
    });
  }

  final _$_PessoaAddControllerBaseActionController =
      ActionController(name: '_PessoaAddControllerBase');

  @override
  void setTabBarController(TabController tabBarController) {
    final _$actionInfo = _$_PessoaAddControllerBaseActionController.startAction(
        name: '_PessoaAddControllerBase.setTabBarController');
    try {
      return super.setTabBarController(tabBarController);
    } finally {
      _$_PessoaAddControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabController: ${tabController}
    ''';
  }
}
