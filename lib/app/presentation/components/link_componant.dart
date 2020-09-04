import 'package:flutter/material.dart';

class LinkComponent extends StatelessWidget {
  final double width;
  final String text;
  final Color color;
  final double size;

  const LinkComponent(
      {Key key,
      this.width,
      this.text = "SEM TEXTO",
      this.color = const Color(0xff6090CE),
      this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Navegar para recupera senha");
      },
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Segoe UI",
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}
