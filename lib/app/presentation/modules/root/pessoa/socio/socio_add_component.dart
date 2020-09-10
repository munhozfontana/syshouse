import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../data/models/socio_model.dart';
import '../../../../mobx/patrimonio_store.dart';
import '../../../../mobx/socio_store.dart';
import '../../../../mobx/utils/enum_load_state.dart';

class SocioAdd extends StatefulWidget {
  @override
  _SocioAddState createState() => _SocioAddState();
}

class _SocioAddState extends State<SocioAdd> {
  final storePatrimonio = Modular.get<StorePatrimonio>();
  final storeSocio = Modular.get<StoreSocio>();
  int patrimonioSelected;

  @override
  void initState() {
    super.initState();
    storePatrimonio.list();
    patrimonioSelected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, screen) {
        return Container(
          width: screen.maxWidth,
          child: Observer(builder: (_) {
            if (storePatrimonio.loadState == EnumLoadState.initial) {
              return const Text("initial");
            } else if (storePatrimonio.loadState == EnumLoadState.loading) {
              return const Text("Loading");
            } else {
              return storePatrimonio.reslist.fold(
                (l) => Text("Fail"),
                (r) => Column(
                  children: [
                    Spacer(),
                    DropdownButton(
                      value: patrimonioSelected,
                      items: [
                        ...r.asMap().entries.map((e) => DropdownMenuItem(
                              child: Text("Item ${e.value.nome}"),
                              value: e.key,
                            ))
                      ],
                      onChanged: (value) => {
                        setState(() => {patrimonioSelected = value}),
                      },
                    ),
                    Spacer(),
                    formSocio(screen),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        RaisedButton(
                            child: Text("Cancelar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Spacer(),
                        RaisedButton(
                            child: Text("Salvar"),
                            onPressed: () {
                              storeSocio.save(storeSocio.param);
                            }),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              );
            }
          }),
        );
      },
    );
  }

  Wrap formSocio(BoxConstraints screen) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome',
              ),
              onChanged: (value) => storeSocio.changeSocio(
                SocioModel(nome: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cpf',
              ),
              onChanged: (value) => storeSocio.changeSocio(
                SocioModel(cpf: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rg',
              ),
              onChanged: (value) => storeSocio.changeSocio(
                SocioModel(rg: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nacionalidade',
              ),
              onChanged: (value) => storeSocio.changeSocio(
                SocioModel(nacionalidade: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Estado Cívil',
              ),
              onChanged: (value) => storeSocio.changeSocio(
                SocioModel(estadoCivil: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Profissão',
              ),
              onChanged: (value) => storeSocio.changeSocio(
                SocioModel(profissao: value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
