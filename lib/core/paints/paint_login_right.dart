import 'package:flutter/material.dart';

class PaintLoginRightDelegate extends StatelessWidget {
  final MediaQueryData mediaQueryData;

  const PaintLoginRightDelegate({Key key, this.mediaQueryData});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PaintLoginRight(),
      child: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff699BDC), Color(0xff517EB9)],
          ),
        ),
      ),
    );
  }
}

class PaintLoginRight extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    const nivelCurva = .08;

    width(procentagem) {
      return size.width * procentagem;
    }

    height(procentagem) {
      return size.height * procentagem;
    }

    path.moveTo(width(1), height(1));
    path.quadraticBezierTo(width(1), height(.65), width(1), height(.65));

    path.quadraticBezierTo(
      width(.65 + nivelCurva),
      height(.83 + nivelCurva),
      width(.65 - nivelCurva),
      height(.83 - nivelCurva),
    );

    path.quadraticBezierTo(
      width(.45 - nivelCurva),
      height(.75 - nivelCurva),
      width(.45 - nivelCurva),
      height(.75 + nivelCurva),
    );

    path.quadraticBezierTo(
      width(.5 - nivelCurva),
      height(1 - nivelCurva),
      width(.5 + nivelCurva),
      height(1 + nivelCurva),
    );

    path.close();
    // path.quadraticBezierTo(width, height, width, height);
    // path.quadraticBezierTo(0, height, 0, height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
