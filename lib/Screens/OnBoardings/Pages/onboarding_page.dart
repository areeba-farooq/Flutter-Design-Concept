import 'package:flutter/material.dart';
import 'package:onboarding_concept/Screens/OnBoardings/widgets/cards.dart';

import '../../../Constants/constants.dart';

class OnboardingPage extends StatelessWidget {
  final int number;
  final AssetImage bgImg;
  final Widget lowerCardChild;

  final Animation<Offset> lowerCardOffsetAnimation;
  final Animation<Offset> upperCardOffsetAnimation;
  final Widget textColumn;
  final List<Color> colors;

  const OnboardingPage({
    super.key,
    required this.colors,
    required this.bgImg,
    required this.number,
    required this.lowerCardChild,
    required this.lowerCardOffsetAnimation,
    required this.upperCardOffsetAnimation,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          colors: colors,
          pageNumber: number,
          cardChild: lowerCardChild,
          lowerCardOffsetAnimation: lowerCardOffsetAnimation,
          upperCardOffsetAnimation: upperCardOffsetAnimation,
          img: bgImg,
        ),
        SizedBox(height: number % 2 == 1 ? 50.0 : 25.0),
        AnimatedSwitcher(
          duration: kCardAnimationDuration,
          child: textColumn,
        ),
      ],
    );
  }
}
