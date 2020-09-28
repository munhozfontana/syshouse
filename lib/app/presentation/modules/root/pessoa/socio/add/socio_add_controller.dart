import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/modules/utils/global_snackbar.dart';

import '../../../../../../../core/usecases/params.dart';
import '../../../../../../data/models/socio_model.dart';
import '../../../../../../domain/entities/patrimonio.dart';
import '../../../../../../domain/usecases/patrimonio_usecases.dart';
import '../../../../../../domain/usecases/socio_usecases.dart';
import '../../../../../mobx/shared/enuns/enum_load_state.dart';
import '../../../../../mobx/shared/loading_store.dart';

part 'socio_add_controller.g.dart';

class SocioAddController = _SocioAddControllerBase with _$SocioAddController;

abstract class _SocioAddControllerBase extends Disposable with Store {
  final ListPatrimonio listPatrimonio;
  final SaveSocio saveSocio;
  final LoadingStore loadingStore;

  @observable
  List<Patrimonio> resListPatrimonio = [];

  TextEditingController nomeSocio = TextEditingController();
  TextEditingController cpfSocio = TextEditingController();
  TextEditingController rgSocio = TextEditingController();
  TextEditingController nacionalidadeSocio = TextEditingController();
  TextEditingController estadoCivilSocio = TextEditingController();
  TextEditingController profissaoSocio = TextEditingController();

  @observable
  int patrimonioSelected = 0;

  @action
  void changePatrimonioSelected(int value) {
    patrimonioSelected = value;
  }

  _SocioAddControllerBase({
    @required this.listPatrimonio,
    @required this.saveSocio,
    @required this.loadingStore,
  });

  @action
  Future<void> init() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    (await listPatrimonio(NoParams())).fold(
      (l) => {
        GlobalScaffold.instance.showSnackBar(l.message),
      },
      (r) => {
        resListPatrimonio = r,
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
  }

  @action
  Future<void> salvarSocio() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    var socio = SocioModel(
      nome: nomeSocio.text,
      cpf: cpfSocio.text,
      rg: rgSocio.text,
      nacionalidade: nacionalidadeSocio.text,
      estadoCivil: estadoCivilSocio.text,
      profissao: profissaoSocio.text,
    );
    (await saveSocio(Params(socioModel: socio))).fold(
      (l) => {
        loadingStore.setLoadState(EnumLoadState.loaded),
        GlobalScaffold.instance.showSnackBar(l.message)
      },
      (r) => {
        loadingStore.setLoadState(EnumLoadState.loaded),
        print(r.id),
      },
    );
  }

  Future<bool> activatePop() async {
    // await Modular.get<PessoaListController>().init();
    Modular.to.pop();
    return true;
  }

  @override
  void dispose() {
    nomeSocio.dispose();
    cpfSocio.dispose();
    rgSocio.dispose();
    nacionalidadeSocio.dispose();
    estadoCivilSocio.dispose();
    profissaoSocio.dispose();
  }
}