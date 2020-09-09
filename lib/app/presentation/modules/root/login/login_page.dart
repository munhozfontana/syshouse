import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/components/button_component.dart';
import 'package:syshouse/app/presentation/components/link_componant.dart';
import 'package:syshouse/app/presentation/components/logo_name_component.dart';
import 'package:syshouse/app/presentation/components/text_field_component.dart';
import 'package:syshouse/core/paints/PaintLoginLeft.dart';
import 'package:syshouse/core/paints/PaintLoginRight.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    // var utils = ResponsiveUtils();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PaintLoginLeftDelegate(mediaQueryData: size),
          PaintLoginRightDelegate(mediaQueryData: size),
          Container(
            width: size.size.width,
            height: size.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: size.size.height * 0.5,
                  width: size.size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFFF000000).withOpacity(.16),
                        blurRadius: 30,
                        offset: Offset(0, 10),
                        spreadRadius: 0,
                      )
                    ],
                    color: Color(0xFFF6F6F6),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment(-1, 0),
                        child: Container(
                          child: _ladoBrancoLogin(),
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, 0),
                        child: Container(
                          child: _ladoAzulLogin(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _ladoAzulLogin() {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          height: constraint.maxHeight,
          width: constraint.maxWidth * .4,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFFF000000).withOpacity(.13),
                blurRadius: 10,
                offset: Offset(-10, 0),
                spreadRadius: 0,
              )
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
              colors: [
                Color(0xFF71A4E8),
                Color(0xFF4E7AB2),
              ],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0, -0.85),
                child: LogoNameComponent(
                  text: "Bem vindo",
                  width: 0.1,
                  colorFont: Color(
                    0xffF6F6F6,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -.15),
                child: Icon(
                  FeatherIcons.home,
                  size: constraint.maxWidth * .15,
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _ladoBrancoLogin() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth * .6,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(0, -0.85),
                child: LogoNameComponent(
                  text: "RentSys",
                  colorFont: Color(0xff73A6EA),
                ),
              ),
              Align(
                alignment: Alignment(0, -.25),
                child: TextFieldComponent(),
              ),
              Align(
                alignment: Alignment(0, .1),
                child: TextFieldComponent(
                  obscureText: true,
                ),
              ),
              Align(
                alignment: Alignment(0, .5),
                child: ButtonComponent(onPress: () {
                  Modular.to.pushReplacementNamed('/pessoa');
                }),
              ),
              Align(
                alignment: Alignment(0, .7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LinkComponent(
                      color: Color(0xff585858),
                      text: "Esqueceu a senha? ",
                    ),
                    LinkComponent(
                      text: "Clique aqui",
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
