import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'components/cliente_component.dart';
import 'socio/list/socio_list_controller.dart';

part 'pessoa_store.g.dart';

class PessoaStore = _PessoaStoreBase with _$PessoaStore;

abstract class _PessoaStoreBase with Store {
  @observable
  ClienteComponentModel cliente = ClienteComponentModel(
    cnpj: TextEditingController(),
    cpf: TextEditingController(),
    dataNascimento: TextEditingController(),
    nome: TextEditingController(),
    rg: TextEditingController(),
    nacionalidade: TextEditingController(),
    endereco: TextEditingController(),
    estadoCivil: TextEditingController(),
    profissao: TextEditingController(),
  );

  Future<bool> activatePop() async {
    await Modular.get<SocioListController>().init();
    Modular.to.pop();
    return true;
  }
}
