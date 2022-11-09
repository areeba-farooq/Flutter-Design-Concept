import 'package:flutter/material.dart';

import '../../../../Constants/constants.dart';

import '../../widgets/icon_container.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          img: Image.asset(
            'assets/icons/pointer.png',
            height: 40,
            width: 40,
          ),
          name: 'Track',
          padding: kPaddingS,
        ),
        IconContainer(
          img: Image.asset(
            'assets/icons/food-delivery.png',
            height: 40,
            width: 40,
          ),
          name: 'Prepare',
          padding: kPaddingS,
        ),
      ],
    );
  }
}
