import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/common_widget/forms/form_header.dart';
import 'package:psm_coding_files/src/features/authentication/controllers/signup_controller.dart';
import 'package:psm_coding_files/src/features/authentication/screens/login/login.dart';
import 'package:psm_coding_files/src/utils/text_settings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();
    final confirmPasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const FormHeader(
                  image: "assets/logo/MainLogo1.png",
                  title: SignUpTitle,
                  subTitle: SignUpSubTitle,
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.fullName,
                        decoration: const InputDecoration(
                          label: Text('Full Name'),
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains("@")) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Obx(() => TextFormField(
                        controller: controller.password,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Password",
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordHidden.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              controller.togglePasswordVisibility();
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Re-enter your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30.0))),
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        validator: (value) {
                          if (value != controller.password.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              SignupController.instance.registerUser(
                                controller.email.text.trim(),
                                controller.password.text.trim(),
                              );
                            }
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("OR"),
                      const SizedBox(height: 10),

                      // 🔥 Google Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: const Image(
                            image: AssetImage("assets/logo/google.jpg"),
                            width: 20.0,
                          ),
                          onPressed: () {
                            AuthenticationRepository.instance.signInWithGoogle();
                          },
                          label: const Text("Sign up with Google"),
                        ),
                      ),

                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
