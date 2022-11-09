import 'package:flutter/material.dart';
import 'package:onboarding_concept/Screens/Registeration/Widgets/input_field.dart';

import '../../../Constants/constants.dart';

import '../../Login/widgets/custom_button.dart';
import '../../../Fade_Transition/fade_transition.dart';

class RegisterationForm extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;

  const RegisterationForm({required this.animation, required this.onTap});

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
              label: 'Username',
              prefixIcon: Icons.person,
              obscureText: true,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: 'Email',
              prefixIcon: Icons.email,
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
              text: 'Signup to continue',
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
                "Already have an account?",
                style: TextStyle(color: kWhite),
              ),
              TextButton(
                onPressed: onTap,
                child: const Text(
                  'Login',
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
