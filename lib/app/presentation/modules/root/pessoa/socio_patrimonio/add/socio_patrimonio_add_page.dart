import 'package:flutter/material.dart';

import '../../../../../../domain/entities/patrimonio.dart';
import 'socio_patrimonio_add_page_model.dart';

class SocioPatrimonioAddPage extends StatefulWidget {
  final Function(SocioPatrimonioAddPageModel) save;
  final Function cancel;
  final List<Patrimonio> listPatriomonio;

  const SocioPatrimonioAddPage({
    this.save,
    this.cancel,
    this.listPatriomonio,
  });

  @override
  _SocioPatrimonioAddPageState createState() {
    return _SocioPatrimonioAddPageState();
  }
}

class _SocioPatrimonioAddPageState extends State<SocioPatrimonioAddPage> {
  // final _formKey = GlobalKey<FormState>();
  SocioPatrimonioAddPageModel model = SocioPatrimonioAddPageModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, screen) {
          return Container();
          // return Form(
          //   key: _formKey,
          //   child: Column(
          //     children: [
          //       Spacer(),
          //       Wrap(
          //         children: [
          //           Padding(
          //             padding: EdgeInsets.symmetric(
          //                 horizontal: screen.maxWidth * 0.05),
          //             child: ConstrainedBox(
          //               constraints: BoxConstraints.tight(
          //                 Size(screen.maxWidth * 0.2, 50),
          //               ),
          //               child: Slider(
          //                 value: model.porcentagem,
          //                 onChanged: (value) => model.porcentagem = value,
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.symmetric(
          //                 horizontal: screen.maxWidth * 0.05),
          //             child: ConstrainedBox(
          //               constraints: BoxConstraints.tight(
          //                 Size(screen.maxWidth * 0.2, 50),
          //               ),
          //               child: Checkbox(
          //                 value: model.proprietario,
          //                 onChanged: (value) => model.proprietario = value,
          //               ),
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.symmetric(
          //                 horizontal: screen.maxWidth * 0.05),
          //             child: ConstrainedBox(
          //               constraints: BoxConstraints.tight(
          //                 Size(screen.maxWidth * 0.2, 50),
          //               ),
          //               child: DropdownButton<String>(
          //                 value: model.patrimonioId,
          //                 icon: Icon(Icons.arrow_downward),
          //                 iconSize: 24,
          //                 elevation: 16,
          //                 onChanged: (value) => model.patrimonioId = value,
          //                 items: widget.listPatriomonio
          //                     .map<DropdownMenuItem<String>>((value) {
          //                   return DropdownMenuItem<String>(
          //                     value: value.id,
          //                     child: Text(value.nome),
          //                   );
          //                 }).toList(),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       Spacer(),
          //       Row(
          //         children: [
          //           Spacer(),
          //           RaisedButton(
          //             child: Text("Cancelar"),
          //             onPressed: widget.cancel,
          //           ),
          //           Spacer(),
          //           RaisedButton(
          //             child: Text("Salvar"),
          //             onPressed: widget.save(model),
          //           ),
          //           Spacer(),
          //         ],
          //       ),
          //       Spacer(),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
