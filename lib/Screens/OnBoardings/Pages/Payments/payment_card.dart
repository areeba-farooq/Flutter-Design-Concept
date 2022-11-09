import 'package:flutter/material.dart';

import '../../../../Constants/constants.dart';
import '../../widgets/icon_container.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          img: Image.asset(
            'assets/icons/credit.png',
            height: 40,
            width: 40,
          ),
          name: 'Cards',
          padding: kPaddingS,
        ),
        IconContainer(
          img: Image.asset(
            'assets/icons/dollar.png',
            height: 40,
            width: 40,
          ),
          name: 'Dollar',
          padding: kPaddingS,
        ),
        IconContainer(
          img: Image.asset(
            'assets/icons/refund.png',
            height: 40,
            width: 40,
          ),
          name: 'Refund',
          padding: kPaddingS,
        ),
      ],
    );
  }
}
