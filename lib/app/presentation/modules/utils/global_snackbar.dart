import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffKey = GlobalKey<ScaffoldState>();

  void showSnackBar(String menssage) {
    scaffKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          menssage,
        ),
      ),
    );
  }
}
