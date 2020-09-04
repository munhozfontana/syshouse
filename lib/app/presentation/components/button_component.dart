import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final double widthPorcent;
  final double heightPorcent;
  final Function onPress;

  const ButtonComponent(
      {Key key,
      this.widthPorcent = .5,
      this.heightPorcent = .095,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          margin: EdgeInsets.all(12),
          width: constraint.maxWidth * widthPorcent,
          height: constraint.maxHeight * heightPorcent,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 5.00),
                color: Color(0xff000000).withOpacity(0.16),
                blurRadius: 10,
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(41.00),
            color: Color(0xff6596d6),
            child: InkWell(
              child: Container(
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: 30,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              onTap: onPress,
            ),
          ),
        );
      },
    );
  }
}
