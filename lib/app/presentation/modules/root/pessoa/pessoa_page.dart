import 'package:flutter/material.dart';

import '../../../components/core/app_bar_component.dart';
import 'components/cliente_component.dart';
import 'components/contato_component.dart';
import 'components/dependente_component.dart';

class PessoaPage extends StatefulWidget {
  @override
  _PessoaPageState createState() => _PessoaPageState();
}

class _PessoaPageState extends State<PessoaPage> {
  bool isPagador;
  bool isSocio;

  @override
  void initState() {
    super.initState();
    isPagador = false;
    isSocio = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().build(context),
      body: Container(
        child: Column(
          children: [
            ClienteComponent(
              isPagador: isPagador,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isPagador,
                  onChanged: (value) {
                    setState(() {
                      isPagador = value;
                    });
                  },
                ),
                Checkbox(
                  value: isSocio,
                  onChanged: (value) {
                    setState(() {
                      isSocio = value;
                    });
                  },
                ),
              ],
            ),
            DependenteComponent(
              isPagador: isPagador,
            ),
            ContatoComponent(),
            Spacer(),
            Row(
              children: [
                Spacer(),
                RaisedButton(child: Text("Cancelar"), onPressed: () {}),
                Spacer(),
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: () {},
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
