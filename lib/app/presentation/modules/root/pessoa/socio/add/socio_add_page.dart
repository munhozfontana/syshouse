import 'package:flutter/material.dart';

import 'socio_add_page_model.dart';

class SocioAddPage extends StatefulWidget {
  final Function(SocioAddPageModel) save;
  final Function cancel;

  const SocioAddPage({
    Key key,
    @required this.save,
    @required this.cancel,
  }) : super(key: key);

  @override
  _SocioAddPageState createState() => _SocioAddPageState();
}

class _SocioAddPageState extends State<SocioAddPage> {
  final _formKey = GlobalKey<FormState>();
  SocioAddPageModel model = SocioAddPageModel();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                        onChanged: (value) => model.nacionalidade = value,
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
                        onChanged: (value) => model.estadoCivil = value,
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
                  RaisedButton(child: Text("Cancelar"), onPressed: () {}),
                  Spacer(),
                  RaisedButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      widget.save(model);
                    },
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
