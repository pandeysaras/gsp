import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gujarati_samaj_paris/widgets/text_field_input.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/color_constant.dart';
import '../utils/routes/routes_name.dart';
import '../utils/ui_constant.dart';
import '../view_model/auth_view_model.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool showPassword = false;
  bool isLoading = false;

  openPrivacyPage() {
    try {
      launchUrlString('http://gujaratisamajparis.org/register.html',
          mode: LaunchMode.externalApplication);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _loginKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // const Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     "Sign In",
                  //     style: UiConstant.mediumHeading,
                  //   ),
                  // ),
                  Image.asset('assets/gujarati_samaj_logo.png'),
                  const SizedBox(height: 30),
                  TextFormField(
                      controller: emailController,
                      validator: validateMail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enterEmail,
                        prefixIcon: Icon(Icons.mail),
                      )),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: passwordController,
                    validator: validatePassword,
                    obscureText: !showPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.enterPassword,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    height: 55,
                    width: double.infinity,
                    onTap: () {
                      dynamic data = {
                        "email": "chauhanmahen@hotmail.com",
                        "password": "pa12"
                      };
                      if (_loginKey.currentState!.validate()) {
                        authViewModel.loginAPi(data, context);
                      }
                      // Navigator.pushNamed(context, RoutesName.homeScreenLayout);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign In",
                          style: UiConstant.smallHeading,
                        ),
                        const SizedBox(width: 20),
                        context.watch<AuthViewModel>().isLoading
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              )
                            : const Icon(Icons.arrow_forward)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.dontHaveAnAccount),
                      TextButton(
                        onPressed: openPrivacyPage,
                        child: const Text("Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateMail(String? mail) {
    if (mail == null || mail.isEmpty) {
      return "enter email";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(mail)) {
      return "enter valid mail";
    } else {
      return null;
    }
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter password";
    } else if (password.length < 6) {
      return "password should be greater than 6";
    } else {
      return null;
    }
  }
}
