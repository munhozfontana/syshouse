import 'package:flutter/material.dart';

class PessoaPageEdit extends StatelessWidget {
  final String id;

  const PessoaPageEdit({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("Pessoa new edit Works"),
      ),
    );
  }
}
