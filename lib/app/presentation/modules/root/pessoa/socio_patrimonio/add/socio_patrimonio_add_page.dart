import 'package:flutter/material.dart';

import '../../../../../../domain/entities/patrimonio.dart';
import '../../../../../components/core/app_bar_component.dart';

class SocioPatrimonioAddPage extends StatefulWidget {
  final List<Patrimonio> listPatriomonio;

  const SocioPatrimonioAddPage({
    this.listPatriomonio = const [],
  });

  @override
  _SocioPatrimonioAddPageState createState() {
    return _SocioPatrimonioAddPageState();
  }
}

class SocioPatrimonioAddPageModel {
  double porcentagem = 0;
  bool proprietario = false;
  String patrimonioId = "";
}

class _SocioPatrimonioAddPageState extends State<SocioPatrimonioAddPage> {
  final _formKey = GlobalKey<FormState>();
  SocioPatrimonioAddPageModel model = SocioPatrimonioAddPageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent().build(context),
      body: LayoutBuilder(
        builder: (context, screen) {
          return Form(
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
                        child: Slider(
                          value: model.porcentagem,
                          onChanged: (value) => model.porcentagem = value,
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
                        child: Checkbox(
                          value: model.proprietario,
                          onChanged: (value) => model.proprietario = value,
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
                        child: DropdownButton<String>(
                          value: model.patrimonioId,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          onChanged: (value) => model.patrimonioId = value,
                          items: widget.listPatriomonio
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.id,
                              child: Text(value.nome),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    RaisedButton(child: Text("Cancelar"), onPressed: () {}),
                    Spacer(),
                    RaisedButton(child: Text("Salvar"), onPressed: () {}),
                    Spacer(),
                  ],
                ),
                Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
