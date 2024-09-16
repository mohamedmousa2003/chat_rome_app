import 'package:chat_rome_app/firebase_options.dart';
import 'package:chat_rome_app/pages/auth/login/login_view.dart';
import 'package:chat_rome_app/pages/auth/register/register_view.dart';
import 'package:chat_rome_app/pages/home/home_view.dart';
import 'package:chat_rome_app/pages/splash/splash_view.dart';
import 'package:chat_rome_app/shared/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure the Flutter framework is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ApplicationTheme.themeLight,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        LoginView.routeName: (context) => LoginView(),
        Register.routeName: (context) => Register(),
        HomeView.routeName: (context) => HomeView(),
      },
    );
  }
}
