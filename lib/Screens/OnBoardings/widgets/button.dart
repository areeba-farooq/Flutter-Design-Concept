import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        padding: const EdgeInsets.all(kPaddingM),
        elevation: 0.0,
        shape: const CircleBorder(),
        fillColor: kWhite.withOpacity(0.1),
        onPressed: onPressed,
        child: Image.asset(
          'assets/icons/right-arrow.png',
          height: 30,
          width: 30,
        ));
  }
}
