import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

class CardsStack extends StatelessWidget {
  final int pageNumber;
  final AssetImage img;
  final List<Color> colors;
  final Widget cardChild;

  final Animation<Offset> lowerCardOffsetAnimation;
  final Animation<Offset> upperCardOffsetAnimation;

  const CardsStack({
    super.key,
    required this.colors,
    required this.img,
    required this.pageNumber,
    required this.cardChild,
    required this.lowerCardOffsetAnimation,
    required this.upperCardOffsetAnimation,
  });

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    final lowerCardWidth = MediaQuery.of(context).size.width - 2 * kPaddingL;
    final upperCardHeight = MediaQuery.of(context).size.height / 3;

    return Padding(
      padding: EdgeInsets.only(top: isOddPageNumber ? 25.0 : 50.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          SlideTransition(
            position: upperCardOffsetAnimation,
            child: Container(
              width: lowerCardWidth,
              height: upperCardHeight,
              padding: EdgeInsets.only(
                top: !isOddPageNumber ? 100.0 : 0.0,
                bottom: isOddPageNumber ? 100.0 : 0.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(image: img, fit: BoxFit.fitHeight),
              ),
            ),
          ),
          Positioned(
            top: !isOddPageNumber ? 200.0 : null,
            bottom: isOddPageNumber ? -60.0 : null,
            child: SlideTransition(
              position: lowerCardOffsetAnimation,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: colors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [0.0, 0.2, 0.8, 1.0],
                    ),
                  ),
                  width: lowerCardWidth * 0.8,
                  height: upperCardHeight * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: kPaddingM),
                  child: Center(child: cardChild),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
