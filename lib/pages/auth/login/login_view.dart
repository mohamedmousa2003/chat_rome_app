import 'package:chat_rome_app/pages/auth/register/register_view.dart';
import 'package:chat_rome_app/pages/home/home_view.dart';
import 'package:chat_rome_app/shared/components/custom_extension.dart';
import 'package:chat_rome_app/shared/components/custom_text_field.dart';
import 'package:chat_rome_app/shared/utils/app_colors.dart';
import 'package:chat_rome_app/shared/utils/const_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const String routeName = 'login';
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: AppColors.white,
        ),
        Image.asset(
          "assets/background.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              ConstText.login,
              style: theme.textTheme.bodyLarge,
            ),
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: mediaQuery.height * 0.25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    8.height,
                    CustomTextField(
                      controller: emailController,
                      hint: ConstText.email,
                      onValidate: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please enter your email";
                        }
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[com]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return "Please enter valid email content @[a-zA-Z0-9]";
                        }
                        return null;
                      },
                      keyboardType: TextInputType
                          .emailAddress, // as to show @ in keyboard
                    ),
                    8.height,
                    CustomTextField(
                      controller: passwordController,
                      hint: ConstText.password,
                      isPassword: true,
                      onValidate: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "please enter your password";
                        }
                        if (text.length < 6) {
                          return "please enter password not less 6 char";
                        }
                        return null;
                      },
                      keyboardType: TextInputType
                          .emailAddress, // as to show @ in keyboard
                    ),
                    20.height,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      onPressed: () {
                        // loginForm();
                        Navigator.pushReplacementNamed(
                            context, HomeView.routeName);
                        // if (formKey.currentState?.validate() == true) {

                        // }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            ConstText.login,
                            style: theme.textTheme.bodyMedium,
                          )),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                    15.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ConstText.noHaveAccount,
                          style: theme.textTheme.titleMedium,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Register.routeName);
                            },
                            child: Text(
                              ConstText.register,
                              style: const TextStyle(color: AppColors.blue),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}