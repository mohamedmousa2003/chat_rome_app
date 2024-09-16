import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_rome_app/pages/auth/login/login_view.dart';
import 'package:chat_rome_app/shared/components/custom_extension.dart';
import 'package:chat_rome_app/shared/utils/app_colors.dart';
import 'package:chat_rome_app/shared/utils/const_text.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context,LoginView.routeName);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/splash_screen.png",
              alignment: Alignment.center,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          30.height,
          DefaultTextStyle(
            style: const TextStyle(
               fontSize: 30,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(ConstText.appName,),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ],
      ),
    );
  }
}
