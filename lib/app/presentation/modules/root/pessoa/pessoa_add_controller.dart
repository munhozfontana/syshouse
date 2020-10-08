import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/usecases/params.dart';
import '../../../../data/models/socio_model.dart';
import '../../../../data/models/socio_patrimonio_model.dart';
import '../../../../domain/usecases/socio_patrimonio_usecases.dart';
import '../../../../domain/usecases/socio_usecases.dart';
import '../../../../presentation/mobx/enuns/enum_load_state.dart';
import '../../../../presentation/mobx/loading_store.dart';
import '../../../../presentation/modules/root/pessoa/socio/list/socio_list_controller.dart';
import '../../../../presentation/modules/utils/global_snackbar.dart';

part 'pessoa_add_controller.g.dart';

class PessoaAddController = _PessoaAddControllerBase with _$PessoaAddController;

abstract class _PessoaAddControllerBase with Store {
  final SaveSocio saveSocio;
  final LoadingStore loadingStore;
  final SaveSocioPatrimonio saveSocioPatrimonio;

  @observable
  TabController tabController;

  _PessoaAddControllerBase({
    @required this.saveSocio,
    @required this.loadingStore,
    @required this.saveSocioPatrimonio,
  });

  @action
  void setTabBarController(TabController tabBarController) {
    tabController = tabBarController;
  }

  @action
  void nextPage() {
    if (tabController.index + 1 < tabController.length) {
      tabController.index = tabController.index + 1;
    }
  }

  @action
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

  // Socio

  Future<void> callSaveSocio({SocioModel socioModel}) async {
    loadingStore.setLoadState(EnumLoadState.loading);

    (await saveSocio(Params(socioModel: socioModel))).fold(
      (l) => {
        loadingStore.setLoadState(EnumLoadState.loaded),
        GlobalScaffold.instance.showSnackBar(l.message)
      },
      (r) => {
        nextPage(),
        GlobalScaffold.instance.showSnackBar("TUDO SALVO"),
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
  }

  @action
  Future<void> callSaveSocioPatrimonio(
      {SocioPatrimonioModel socioPatrimonioModel}) async {
    loadingStore.setLoadState(EnumLoadState.loading);
    (await saveSocioPatrimonio(
            Params(socioPatrimonioModel: socioPatrimonioModel)))
        .fold(
      (l) => {
        loadingStore.setLoadState(EnumLoadState.loaded),
        GlobalScaffold.instance.showSnackBar(l.message)
      },
      (r) => {
        // nextPage(),
        GlobalScaffold.instance.showSnackBar("TUDO SALVO"),
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
    ;
  }
}
