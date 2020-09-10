import 'package:flutter/material.dart';

class TextFieldSearchComponent extends StatelessWidget {
  final double widthProcent;
  final dynamic colorBackground;
  final String placeholder;

  const TextFieldSearchComponent(
      {Key key,
      this.widthProcent = .5,
      this.colorBackground = 0xffFFFFFF,
      this.placeholder = "Digite ..."});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraint,
      ) {
        var heightField = constraint.maxHeight * .06;
        return Container(
          child: Column(
            children: <Widget>[
              input(constraint, heightField),
              SizedBox(height: heightField * .2),
              sugestions(constraint, heightField, 3),
            ],
          ),
        );
      },
    );
  }

  Container sugestions(
    BoxConstraints constraint,
    heightField,
    numberSugestions,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
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
      height: heightField * numberSugestions,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: heightField,
              color: Colors.red.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.green.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.red.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.green.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.red.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.green.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.red.withOpacity(0.5),
            ),
            Container(
              height: heightField,
              color: Colors.green.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Container input(BoxConstraints constraint, heightField) {
    return Container(
      height: heightField,
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
  }
}
