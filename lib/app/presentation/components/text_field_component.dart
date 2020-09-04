import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final double widthProcent;
  final dynamic colorBackground;
  final String placeholder;
  final bool obscureText;

  const TextFieldComponent(
      {Key key,
      this.widthProcent = .5,
      this.colorBackground = 0xffFFFFFF,
      this.placeholder = "Digite ...",
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          decoration: BoxDecoration(
            color: Color(colorBackground),
            borderRadius: BorderRadius.all(
              const Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 5.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 10,
              ),
            ],
          ),
          width: constraint.maxWidth * widthProcent,
          child: TextFormField(
            obscureText: obscureText,
            autofocus: false,
            style: TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
              hoverColor: Colors.transparent,
              border: InputBorder.none,
              filled: true,
              hintStyle: TextStyle(
                fontFamily: "Segoe UI",
                fontSize: 20,
                color: Color(0xff707070).withOpacity(0.58),
              ),
              hintText: placeholder,
              fillColor: Colors.white70.withOpacity(0),
            ),
          ),
        );
      },
    );
  }
}
