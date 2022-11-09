import 'package:flutter/material.dart';

class BlackClipper extends CustomClipper<Path> {
  final double yOffset;

  const BlackClipper({
    required this.yOffset,
  });

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 220.0 + yOffset)
    ..quadraticBezierTo(
      size.width / 2,
      300.0 + yOffset,
      size.width,
      178.0 + yOffset,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
