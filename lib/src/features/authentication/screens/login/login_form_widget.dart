import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: "Email"),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: "Password"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            try {
              await AuthenticationRepository.instance.loginUser(
                emailController.text.trim(),
                passwordController.text.trim(),
              );
              Get.snackbar("Success", "Login successful!");
              // Navigate to home or dashboard
            } catch (e) {
              Get.snackbar("Login Failed", e.toString());
            }
          },
          child: const Text("Login"),
        )
      ],
    );
  }
}
