import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:psm_coding_files/src/common_widget/forms/form_header.dart';
import 'package:psm_coding_files/src/utils/text_settings.dart';
import '../../../../custom_dialogs/custom_dialogs.dart';
import '../../controllers/signup_controller.dart';
import '../dashboard/main_page.dart';
import '../dashboard/main_page.dart';
import '../signup/SignUp.dart';
import 'login_form_widget.dart';
import 'login_header.dart';
import '../../../../auth_repo/authentication_repository.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF90CAF9), Color(0xFF2196F3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(height: 40),
                  FormHeader(
                    image: 'assets/logo/MainLogo1.png',
                    title: LoginTitle,
                    subTitle: LoginSubTitle,
                  ),
                  SizedBox(height: 30),
                  LoginForm(),
                  SizedBox(height: 20),
                  LoginFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton.icon(
            icon: const Image(
              image: AssetImage("assets/logo/google.jpg"),
              width: 20.0,
            ),
            onPressed: () async {
              try {
                await AuthenticationRepository.instance.signInWithGoogle();
                // Show success message
                showSuccessDialog(context, "Login Successful", "Welcome back!");

                // Navigate to main page
                Get.offAll(() => const MainPage());  // Navigating to MainPage after successful login
              } catch (e) {
                // Handle errors if any
                showErrorDialog(context, "Login Failed", e.toString());

              }
            },
            label: const Text("Sign In With Google"),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()),
            );
          },
          child: const Text.rich(
            TextSpan(
              text: "Don't Have an Account? > ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

