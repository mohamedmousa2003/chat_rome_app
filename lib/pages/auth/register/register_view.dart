import 'package:chat_rome_app/shared/components/custom_extension.dart';
import 'package:chat_rome_app/shared/components/custom_text_field.dart';
import 'package:chat_rome_app/shared/utils/app_colors.dart';
import 'package:chat_rome_app/shared/utils/const_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  Register({super.key});

  static String routeName = "register";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmationPasswordController = TextEditingController();

  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // object of view model
  // RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => null,
      child: Stack(
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
                ConstText.register,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: mediaQuery.height * 0.25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        10.height,
                        CustomTextField(
                          controller: firstNameController,
                          hint: ConstText.firstName,
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your full name";
                            }
                            return null;
                          },
                        ),
                        8.height,
                        CustomTextField(
                          controller: lastNameController,
                          hint: ConstText.lastName,
                          onValidate: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter your full name";
                            }
                            return null;
                          },
                        ),
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
                            validedForm();
                            if (formKey.currentState?.validate() == true) {}
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                ConstText.createAccount,
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
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Already have an account",
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void validedForm() async {
    if (formKey.currentState?.validate() == true) {
      // register
      //  viewModel.registerFirebaseAuth(
      //   emailController: emailController,
      //    passwordController: passwordController
      //    );
    }
  }

// void register() async {
//   if (formKey.currentState?.validate() == true) {
//     // register
//     // show loading
//     DialogUtils.showLoading(context, "Loading...");
//     //await Future.delayed(Duration(seconds: 3));
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email_Controller.text,
//         password: password_Controller.text,
//       );
//       // hide loading
//       DialogUtils.hideLoading(context);
//       // show message
//       DialogUtils.ShowMessage(context, "register successfully",
//           messageTitle: "success",
//           posActionName: "OK",
//           titleTextStyle: TextStyle(
//               color: greenColor, fontSize: 30, fontWeight: FontWeight.bold),
//           barrierDismissible: false);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         // hide loading
//         DialogUtils.hideLoading(context);
//         // show message
//         DialogUtils.ShowMessage(context, "The password provided is too weak.",
//             messageTitle: "Error",
//             posActionName: "OK",
//             titleTextStyle: TextStyle(
//               color: redColor,
//               fontWeight: FontWeight.bold,
//               fontSize: 30,
//             ),
//             barrierDismissible: false);
//       } else if (e.code == 'email-already-in-use') {
//         // hide loading
//         DialogUtils.hideLoading(context);
//         // show message
//         DialogUtils.ShowMessage(
//             context, "The account already exists for that email.",
//             messageTitle: "Error",
//             titleTextStyle: TextStyle(
//               color: redColor,
//               fontWeight: FontWeight.bold,
//               fontSize: 30,
//             ),
//             posActionName: "OK",
//             barrierDismissible: false);
//       }
//     } catch (e) {
//       // hide loading
//       DialogUtils.hideLoading(context);
//       // show message
//       DialogUtils.ShowMessage(context, e.toString(),
//           messageTitle: "Error",
//           posActionName: "OK",
//           titleTextStyle: TextStyle(
//             color: redColor,
//             fontSize: 30,
//           ),
//           barrierDismissible: false);
//     }
//   }
// }
}

/*
  */
