import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/presentation/components/core/app_bar_component.dart';
import 'package:syshouse/app/presentation/components/loading_component.dart';
import 'package:syshouse/app/presentation/mobx/loading_store.dart';
import 'package:syshouse/app/presentation/modules/root/pessoa/socio/add/socio_add_controller.dart';

class SocioAddPage extends StatefulWidget {
  _SocioAddPageState createState() => _SocioAddPageState();
}

class SocioAddPageModel {
  String nome;
  String cpf;
  String rg;
  String nacionalidade;
  String estadoCivil;
  String profissao;
}

class _SocioAddPageState
    extends ModularState<SocioAddPage, SocioAddController> {
  final _formKey = GlobalKey<FormState>();
  SocioAddPageModel model = SocioAddPageModel();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.activatePop,
      child: Scaffold(
        appBar: AppBarComponent().build(context),
        body: LayoutBuilder(
          builder: (context, screen) {
            return Observer(
              builder: (context) {
                return LoadingComponent(
                  state: Modular.get<LoadingStore>().loadState,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Spacer(),
                        Wrap(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screen.maxWidth * 0.05),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(screen.maxWidth * 0.2, 50),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Nome',
                                  ),
                                  onChanged: (value) => model.nome = value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screen.maxWidth * 0.05),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(screen.maxWidth * 0.2, 50),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Cpf',
                                  ),
                                  onChanged: (value) => model.cpf = value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screen.maxWidth * 0.05),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(screen.maxWidth * 0.2, 50),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Rg',
                                  ),
                                  onChanged: (value) => model.rg = value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screen.maxWidth * 0.05),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(screen.maxWidth * 0.2, 50),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Nacionalidade',
                                  ),
                                  onChanged: (value) =>
                                      model.nacionalidade = value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screen.maxWidth * 0.05),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(screen.maxWidth * 0.2, 50),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Estado Cívil',
                                  ),
                                  onChanged: (value) =>
                                      model.estadoCivil = value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screen.maxWidth * 0.05),
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(screen.maxWidth * 0.2, 50),
                                ),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: 'Profissão',
                                  ),
                                  onChanged: (value) => model.profissao = value,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            RaisedButton(
                                child: Text("Cancelar"), onPressed: () {}),
                            Spacer(),
                            RaisedButton(
                              child: Text("Salvar"),
                              onPressed: () {
                                controller.callSaveSocio(
                                  socioModel: SocioModel(
                                    cpf: model.cpf,
                                    estadoCivil: model.estadoCivil,
                                    nacionalidade: model.nacionalidade,
                                    nome: model.nome,
                                    profissao: model.profissao,
                                    rg: model.rg,
                                  ),
                                );
                              },
                            ),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
