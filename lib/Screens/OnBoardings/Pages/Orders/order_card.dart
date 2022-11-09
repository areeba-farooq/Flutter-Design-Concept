import 'package:flutter/material.dart';

import '../../../../Constants/constants.dart';

import '../../widgets/icon_container.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          img: Image.asset(
            'assets/icons/beef.png',
            height: 40,
            width: 40,
          ),
          name: 'Beef',
          padding: kPaddingS,
        ),
        IconContainer(
          img: Image.asset(
            'assets/icons/pizza.png',
            height: 40,
            width: 40,
          ),
          name: 'Pizza',
          padding: kPaddingS,
        ),
        IconContainer(
          img: Image.asset(
            'assets/icons/sandwich.png',
            height: 40,
            width: 40,
          ),
          name: 'Sandwich',
          padding: kPaddingS,
        ),
      ],
    );
  }
}
