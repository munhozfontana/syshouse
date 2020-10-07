import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/pessoa_add_controller.dart';

import '../../../../../../../core/usecases/params.dart';
import '../../../../../../data/models/socio_model.dart';
import '../../../../../../domain/usecases/patrimonio_usecases.dart';
import '../../../../../../domain/usecases/socio_usecases.dart';
import '../../../../../mobx/enuns/enum_load_state.dart';
import '../../../../../mobx/loading_store.dart';
import '../../../../utils/global_snackbar.dart';

part 'socio_add_controller.g.dart';

class SocioAddController = _SocioAddControllerBase with _$SocioAddController;

abstract class _SocioAddControllerBase extends Disposable with Store {
  final ListPatrimonio listPatrimonio;
  final SaveSocio saveSocio;
  final LoadingStore loadingStore;

  TextEditingController nomeSocio = TextEditingController();
  TextEditingController cpfSocio = TextEditingController();
  TextEditingController rgSocio = TextEditingController();
  TextEditingController nacionalidadeSocio = TextEditingController();
  TextEditingController estadoCivilSocio = TextEditingController();
  TextEditingController profissaoSocio = TextEditingController();

  _SocioAddControllerBase({
    @required this.listPatrimonio,
    @required this.saveSocio,
    @required this.loadingStore,
  });

  @observable
  String lastSocioSave;

  @action
  Future<void> init() async {}

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
        lastSocioSave = r.id,
        Modular.get<PessoaAddController>().nextPage(),
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
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
