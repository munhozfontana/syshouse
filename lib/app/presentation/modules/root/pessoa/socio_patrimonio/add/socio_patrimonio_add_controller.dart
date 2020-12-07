import 'package:mobx/mobx.dart';
import 'package:syshouse/core/usecases/params.dart';

import '../../../../../../data/models/socio_patrimonio_model.dart';
import '../../../../../../domain/usecases/socio_patrimonio_usecases.dart';
import '../../../../../../presentation/mobx/enuns/enum_load_state.dart';
import '../../../../../../presentation/mobx/loading_store.dart';
import '../../../../../../presentation/modules/root/pessoa/pessoa_store.dart';
import '../../../../../../presentation/modules/utils/global_snackbar.dart';

part 'socio_patrimonio_add_controller.g.dart';

class SocioPatrimonioAddController = _SocioPatrimonioAddControllerBase
    with _$SocioPatrimonioAddController;

abstract class _SocioPatrimonioAddControllerBase with Store {
  final LoadingStore loadingStore;
  final SaveSocioPatrimonio saveSocioPatrimonio;
  final PessoaStore pessoaStore;

  _SocioPatrimonioAddControllerBase({
    this.loadingStore,
    this.saveSocioPatrimonio,
    this.pessoaStore,
  });

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
        // pessoaStore.setSocioPatrimonio(r),
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
  }
}
