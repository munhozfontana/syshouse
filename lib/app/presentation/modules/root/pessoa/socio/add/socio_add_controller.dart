import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pessoa_store.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/list/socio_list_controller.dart';

import '../../../../../../../core/usecases/params.dart';
import '../../../../../../data/models/socio_model.dart';
import '../../../../../../domain/usecases/socio_usecases.dart';
import '../../../../../../presentation/mobx/enuns/enum_load_state.dart';
import '../../../../../../presentation/mobx/loading_store.dart';
import '../../../../../../presentation/modules/utils/global_snackbar.dart';

part 'socio_add_controller.g.dart';

class SocioAddController = _SocioAddControllerBase with _$SocioAddController;

abstract class _SocioAddControllerBase with Store {
  final SaveSocio saveSocio;
  final LoadingStore loadingStore;
  final PessoaStore pessoaStore;

  _SocioAddControllerBase({
    this.saveSocio,
    this.loadingStore,
    this.pessoaStore,
  });

  Future<bool> activatePop() async {
    await Modular.get<SocioListController>().init();
    Modular.to.pop();
    return true;
  }

  @action
  Future<void> callSaveSocio({SocioModel socioModel}) async {
    loadingStore.setLoadState(EnumLoadState.loading);

    var res = await saveSocio(Params(socioModel: socioModel));

    loadingStore.setLoadState(EnumLoadState.loaded);
    res.fold(
      (l) => {
        GlobalScaffold.instance.showSnackBar(l.message),
      },
      (r) => {
        // pessoaStore.setClienteComponentModel(r),
        Modular.to.pushNamed('/pessoa/socio-patrimonio/add')
      },
    );
  }
}
