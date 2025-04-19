
import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/common_widget/forms/form_header.dart';
import 'package:psm_coding_files/src/utils/text_settings.dart';
import '../../../../auth_repo/authentication_repository.dart';
import '../../controllers/signup_controller.dart';
import '../signup/SignUp.dart';
import 'login_form_widget.dart';
import 'login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child:Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormHeader(image: 'assets/logo/MainLogo1.png', title: LoginTitle, subTitle: LoginSubTitle,), //Form
                LoginForm(),
                LoginFooter()
            ],

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
            onPressed: () {
              AuthenticationRepository.instance.signInWithGoogle();
            },
            label: const Text("SignIn With Google"),
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
              style: TextStyle(color: Colors.blueAccent),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(color: Colors.blueAccent),
                )
              ],
            ),
          ),
        ),
        // const SizedBox(height: 10),
        // ElevatedButton(
        //   onPressed: () {
        //     SignupController.instance.resendVerificationEmail();
        //   },
        //   child: const Text("Resend Verification Email"),
        // ),
      ],
    );
  }
}





