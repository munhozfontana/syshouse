import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/modules/utils/global_snackbar.dart';

import '../../../../../../core/usecases/params.dart';
import '../../../../../data/models/socio_model.dart';
import '../../../../../domain/entities/patrimonio.dart';
import '../../../../../domain/usecases/patrimonio_usecases.dart';
import '../../../../../domain/usecases/socio_usecases.dart';
import '../../../../mobx/shared/enuns/enum_load_state.dart';
import '../../../../mobx/shared/loading_store.dart';
import '../list/pessoa_list_controller.dart';

part 'pessoa_add_controller.g.dart';

class PessoaAddController = _PessoaAddControllerBase with _$PessoaAddController;

abstract class _PessoaAddControllerBase extends Disposable with Store {
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

  _PessoaAddControllerBase({
    @required this.listPatrimonio,
    @required this.saveSocio,
    @required this.loadingStore,
  });

  @action
  Future<void> init() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    (await listPatrimonio(NoParams())).fold(
      (l) => GlobalScaffold.instance.showSnackBar(l.message),
      (r) => {
        resListPatrimonio = r,
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
  }

  @action
  Future<void> salvarSocio() async {
    var socio = SocioModel(
      nome: nomeSocio.text,
      cpf: cpfSocio.text,
      rg: rgSocio.text,
      nacionalidade: nacionalidadeSocio.text,
      estadoCivil: estadoCivilSocio.text,
      profissao: profissaoSocio.text,
    );
    (await saveSocio(Params(socioModel: socio))).fold(
      (l) => GlobalScaffold.instance.showSnackBar(l.message),
      (r) => null,
    );
  }

  Future<bool> activatePop() async {
    await Modular.get<PessoaListController>().init();
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
