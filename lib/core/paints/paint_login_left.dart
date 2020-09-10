import 'package:flutter/cupertino.dart';

class PaintLoginLeftDelegate extends StatelessWidget {
  final MediaQueryData mediaQueryData;

  const PaintLoginLeftDelegate({Key key, this.mediaQueryData});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PaintLoginLeft(),
      child: Container(
        width: mediaQueryData.size.width * .3,
        height: mediaQueryData.size.height * .95,
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

class PaintLoginLeft extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;

    path.lineTo(0, height);
    path.quadraticBezierTo(0, height, 0, height * .9);
    path.quadraticBezierTo(width * .4, height * .95, width * .25, height * .8);
    path.quadraticBezierTo(width * .05, height * .7, width * .15, height * .6);
    path.quadraticBezierTo(width * .25, height * .5, width * .45, height * .4);
    path.quadraticBezierTo(width * .6, height * .30, width * .6, height * .15);
    path.quadraticBezierTo(
        width * .55, height * -.10, width * .30, height * -.10);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return oldClipper != this;
  }
}
