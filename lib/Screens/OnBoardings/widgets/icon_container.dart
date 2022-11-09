import 'package:flutter/material.dart';
import 'package:onboarding_concept/Constants/constants.dart';

class IconContainer extends StatelessWidget {
  final Image img;
  final double padding;
  final String name;

  const IconContainer({
    required this.img,
    required this.name,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              color: kWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: img),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 15, color: kWhite, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
