import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/features/authentication/screens/dashboard/main_page.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      children: [
        // Email input field
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        // Password input field
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Password",
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        // Login button
        ElevatedButton(
          onPressed: () async {
            try {
              // Attempt login with email and password
              await AuthenticationRepository.instance.loginUser(
                emailController.text.trim(),
                passwordController.text.trim(),
              );
              // Show success pop-up dialog
              _showSuccessDialog(context);
            } catch (e) {
              // Show error pop-up if login fails
              Get.snackbar("Login Failed", e.toString());
            }
          },
          child: const Text("Login"),
        ),
      ],
    );
  }

  // Function to show success dialog after login
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60.0,
              ),
              const SizedBox(height: 20),
              const Text(
                "Login Successful!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "You have logged in successfully. Welcome to the app!",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
                child: const Text("Go to Dashboard"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
