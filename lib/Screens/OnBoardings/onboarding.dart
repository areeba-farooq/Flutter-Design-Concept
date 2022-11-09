import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_concept/Screens/OnBoardings/widgets/button.dart';
import 'package:onboarding_concept/Screens/OnBoardings/widgets/page_indicator.dart';

import '../../Constants/constants.dart';

import '../Login/login_screen.dart';

import 'Pages/Delivery/delivery_card.dart';
import 'Pages/Delivery/delivery_text.dart';
import 'Pages/Orders/order_text.dart';
import 'Pages/Orders/order_card.dart';
import 'Pages/Payments/payment_text.dart';
import 'Pages/Payments/payment_card.dart';
import 'Pages/onboarding_page.dart';

import 'widgets/header.dart';

import 'widgets/ripple.dart';

class Onboarding extends StatefulWidget {
  final double screenHeight;

  const Onboarding({
    super.key,
    required this.screenHeight,
  });

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  late final AnimationController _cardsAnimationController;
  late final AnimationController _pageIndicatorAnimationController;
  late final AnimationController _rippleAnimationController;

  late Animation<Offset> _slideAnimationLightCard;
  late Animation<Offset> _slideAnimationDarkCard;
  late Animation<double> _pageIndicatorAnimation;
  late Animation<double> _rippleAnimation;

  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: kCardAnimationDuration,
    );
    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: kButtonAnimationDuration,
    );
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: widget.screenHeight,
    ).animate(CurvedAnimation(
      parent: _rippleAnimationController,
      curve: Curves.easeIn,
    ));

    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  bool get isFirstPage => _currentPage == 1;

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return OnboardingPage(
          number: 1,
          colors: [
            Colors.orange.withOpacity(0.4),
            Colors.yellow.withOpacity(0.1),
            Colors.yellow.withOpacity(0.1),
            Colors.orange.withOpacity(0.4),
          ],
          bgImg: const AssetImage('assets/icons/dish.png'),
          lowerCardChild: const OrderCard(),
          lowerCardOffsetAnimation: _slideAnimationLightCard,
          upperCardOffsetAnimation: _slideAnimationDarkCard,
          textColumn: const OrderText(),
        );
      case 2:
        return OnboardingPage(
          colors: [
            Colors.blue.withOpacity(0.4),
            Colors.blueAccent.withOpacity(0.1),
            Colors.blueAccent.withOpacity(0.1),
            Colors.blue.withOpacity(0.4),
          ],
          bgImg: const AssetImage('assets/icons/operation.png'),
          number: 2,
          lowerCardChild: const PaymentCard(),
          lowerCardOffsetAnimation: _slideAnimationLightCard,
          upperCardOffsetAnimation: _slideAnimationDarkCard,
          textColumn: const PaymentText(),
        );
      case 3:
        return OnboardingPage(
          colors: [
            Colors.red.withOpacity(0.3),
            Colors.redAccent.withOpacity(0.1),
            Colors.redAccent.withOpacity(0.1),
            Colors.red.withOpacity(0.3),
          ],
          bgImg: const AssetImage('assets/icons/fast-delivery.png'),
          number: 3,
          lowerCardChild: const DeliveryCard(),
          lowerCardOffsetAnimation: _slideAnimationLightCard,
          upperCardOffsetAnimation: _slideAnimationDarkCard,
          textColumn: const DeliveryText(),
        );
      default:
        throw Exception("Page with number '$_currentPage' does not exist.");
    }
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: const Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: const Offset(1.5, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeOut,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _slideAnimationLightCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-3.0, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));
      _slideAnimationDarkCard = Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(-1.5, 0.0),
      ).animate(CurvedAnimation(
        parent: _cardsAnimationController,
        curve: Curves.easeIn,
      ));
      _cardsAnimationController.reset();
    });
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(2);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(3);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
        }
        break;
      case 3:
        if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
          await _goToLogin();
        }
        break;
    }
  }

  Future<void> _goToLogin() async {
    await _rippleAnimationController.forward();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Login(screenHeight: widget.screenHeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Column(
                children: <Widget>[
                  Header(onSkip: _goToLogin),
                  Expanded(child: _getPage()),
                  AnimatedBuilder(
                    animation: _pageIndicatorAnimation,
                    builder: (_, Widget? child) {
                      return OnboardingPageIndicator(
                        angle: _pageIndicatorAnimation.value,
                        currentPage: _currentPage,
                        child: child!,
                      );
                    },
                    child: NextPageButton(onPressed: _nextPage),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _rippleAnimation,
            builder: (_, Widget? child) {
              return Ripple(radius: _rippleAnimation.value);
            },
          ),
        ],
      ),
    );
  }
}
