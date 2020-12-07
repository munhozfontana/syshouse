import 'package:flutter/material.dart';

class DependenteComponent extends StatefulWidget {
  final bool isPagador;

  const DependenteComponent({
    this.isPagador,
  });

  @override
  _DependenteComponentState createState() => _DependenteComponentState();
}

class _DependenteComponentState extends State<DependenteComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isPagador,
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        curve: Curves.bounceInOut,
        child: Center(
          child: Text("DependenteComponent"),
        ),
      ),
    );
  }
}
