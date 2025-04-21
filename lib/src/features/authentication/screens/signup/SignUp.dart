import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/common_widget/forms/form_header.dart';
import 'package:psm_coding_files/src/features/authentication/controllers/signup_controller.dart';
import 'package:psm_coding_files/src/features/authentication/screens/login/login.dart';
import 'package:psm_coding_files/src/utils/text_settings.dart';
import 'package:psm_coding_files/src/features/authentication/screens/dashboard/main_page.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();
    final confirmPasswordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Gradient Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF9048B8), Color(0xFF4DA2DD)], // Purple gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const FormHeader(
                      image: "assets/logo/MainLogo1.png",
                      title: SignUpTitle,
                      subTitle: SignUpSubTitle,
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.fullName,
                            decoration: const InputDecoration(
                              label: Text('Full Name'),
                              hintText: "Enter your full name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              prefixIcon: Icon(Icons.person),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: controller.email,
                            decoration: const InputDecoration(
                              label: Text('Email'),
                              hintText: "Enter your email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                              ),
                              prefixIcon: Icon(Icons.email),
                              filled: true,
                              fillColor: Colors.white,
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
                          const SizedBox(height: 15),
                          Obx(() => TextFormField(
                            controller: controller.password,
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: "Password",
                              hintText: "Enter your password",
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
                              filled: true,
                              fillColor: Colors.white,
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
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                labelText: "Confirm Password",
                                hintText: "Re-enter your password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                                filled: true,
                                fillColor: Colors.white),
                            validator: (value) {
                              if (value != controller.password.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          SizedBox(
                            height: 60,
                            width: 120,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue, // Darker shade for the button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 5),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    await SignupController.instance.registerUser(
                                      controller.email.text.trim(),
                                      controller.password.text.trim(),
                                    );
                                    // Navigate to MainPage after successful sign up
                                    Get.offAll(() => const MainPage());
                                    Get.snackbar("Success", "Sign-up successful!");
                                  } catch (e) {
                                    Get.snackbar("Error", e.toString());
                                  }
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
                            height: 50,
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              icon: const Image(
                                image: AssetImage("assets/logo/google.jpg"),
                                width: 30.0,
                              ),
                              onPressed: () async {
                                try {
                                  await AuthenticationRepository.instance.signInWithGoogle();
                                  // Navigate to MainPage after Google Sign-Up
                                  Get.offAll(() => const MainPage());
                                  Get.snackbar("Success", "Signed up with Google!");
                                } catch (e) {
                                  Get.snackbar("Error", e.toString());
                                }
                              },
                              label: const Text("Sign up with Google"),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.cyanAccent, width: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
