import 'package:flutter/material.dart';
import 'package:onboarding_concept/Logo/logo.dart';

import '../../../Constants/constants.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    super.key,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Logo(),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: kWhite,
                ),
          ),
        ),
      ],
    );
  }
}
