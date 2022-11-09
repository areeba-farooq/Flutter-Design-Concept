import 'package:flutter/material.dart';

import '../../Constants/constants.dart';

import '../../Custom_clippers/black_clipper.dart';
import '../../Custom_clippers/amber_clipper.dart';
import '../../Custom_clippers/orange_clipper.dart';
import '../../Custom_clippers/brown_clipper.dart.dart';
import '../Registeration/signup.dart';
import 'widgets/header.dart';
import 'widgets/login_form.dart';

class Login extends StatefulWidget {
  final double screenHeight;

  const Login({
    required this.screenHeight,
  });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _headerTextAnimation;
  late final Animation<double> _formElementAnimation;
  late final Animation<double> _whiteTopClipperAnimation;
  late final Animation<double> _blueTopClipperAnimation;
  late final Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kLoginAnimationDuration,
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeInOut,
      ),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.7,
        1.0,
        curve: Curves.easeInOut,
      ),
    ));

    final clipperOffsetTween = Tween<double>(
      begin: widget.screenHeight,
      end: 0.0,
    );
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.2,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.35,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          0.7,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlack,
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _whiteTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: BrownClipper(
                  yOffset: _whiteTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: Colors.brown[800]),
          ),
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: OrangeClipper(
                  yOffset: _greyTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: Colors.orange),
          ),
          AnimatedBuilder(
            animation: _greyTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: AmberClipper(
                  yOffset: _greyTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: Colors.amber[300]),
          ),
          AnimatedBuilder(
            animation: _blueTopClipperAnimation,
            builder: (_, Widget? child) {
              return ClipPath(
                clipper: BlackClipper(
                  yOffset: _blueTopClipperAnimation.value,
                ),
                child: child,
              );
            },
            child: Container(color: Colors.black),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kPaddingM),
              child: Column(
                children: <Widget>[
                  Header(animation: _headerTextAnimation),
                  const Spacer(),
                  LoginForm(
                    animation: _formElementAnimation,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Signup(
                            screenHeight: widget.screenHeight,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
