import 'package:flutter/material.dart';

class AmberClipper extends CustomClipper<Path> {
  final double yOffset;

  const AmberClipper({
    required this.yOffset,
  });

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 265.0 + yOffset)
    ..quadraticBezierTo(
      size.width / 2,
      295.0 + yOffset,
      size.width,
      196.0 + yOffset,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
