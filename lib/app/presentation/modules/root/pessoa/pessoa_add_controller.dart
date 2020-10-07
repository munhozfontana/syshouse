import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/list/socio_list_controller.dart';

part 'pessoa_add_controller.g.dart';

class PessoaAddController = _PessoaAddControllerBase with _$PessoaAddController;

abstract class _PessoaAddControllerBase with Store {
  @observable
  TabController tabController;

  @action
  void setTabBarController(TabController tabBarController) {
    tabController = tabBarController;
  }

  void nextPage() {
    if (tabController.index + 1 < tabController.length) {
      tabController.index = tabController.index + 1;
    }
  }

  void backPage() {
    if (tabController.index > 0) {
      tabController.index = tabController.index - 1;
    }
  }

  Future<bool> activatePop() async {
    await Modular.get<SocioListController>().init();
    Modular.to.pop();
    return true;
  }
}
