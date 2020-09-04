import 'package:flutter/material.dart';

class LogoNameComponent extends StatelessWidget {
  final String text;
  final Color colorFont;
  final double colorFontOpacity;
  final double width;
// Color(0xff73a6ea)
  const LogoNameComponent(
      {Key key,
      this.colorFont,
      this.colorFontOpacity = 1,
      this.width = 0.075,
      this.text = "SEM TEXTO"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Text(
          text,
          style: TextStyle(
            fontFamily: "Segoe UI",
            fontSize: constraint.maxWidth * width,
            color: colorFont != null
                ? colorFont.withOpacity(colorFontOpacity)
                : Colors.white,
            shadows: [
              Shadow(
                offset: Offset(0.00, 5.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
