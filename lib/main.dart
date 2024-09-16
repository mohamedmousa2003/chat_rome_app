import 'package:chat_rome_app/pages/auth/login/login_view.dart';
import 'package:chat_rome_app/pages/splash/splash_view.dart';
import 'package:chat_rome_app/shared/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      home:  SplashView(),
      theme: ApplicationTheme.themeLight,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
         LoginView.routeName: (context) => const LoginView(),
      },
    );
  }
}
