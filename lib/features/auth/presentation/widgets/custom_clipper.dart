import 'package:flutter/material.dart';

/// In case the company needs a custom hover with any image use this widget, in this test,
/// the image is not the final one, but it is just to show the idea
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..quadraticBezierTo(
          size.width * 0.1, size.height, size.width * 1.2, size.height * 0.6)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
