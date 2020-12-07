import 'package:flutter/material.dart';

class ContatoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.bounceInOut,
      child: Center(
        child: Text("ContatoComponent"),
      ),
    );
  }
}
