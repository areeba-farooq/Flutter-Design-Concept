import 'package:flutter/material.dart';

import '../../../Constants/constants.dart';

import '../../Registeration/signup.dart';
import 'custom_button.dart';

import '../../../Fade_Transition/fade_transition.dart';
import 'input_field.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;

  const LoginForm({required this.animation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: const CustomInputField(
              label: 'Username or Email',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: Colors.orange,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: () {},
            ),
          ),
          SizedBox(height: 2 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              color: kWhite.withOpacity(0.2),
              textColor: kWhite,
              text: 'Create a Guest Account',
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: space,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: kWhite),
              ),
              TextButton(
                onPressed: onTap,
                child: const Text(
                  'SignUp',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
