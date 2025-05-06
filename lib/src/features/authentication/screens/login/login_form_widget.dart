import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/features/authentication/controllers/login_controller.dart'; // ✅ import your controller

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController()); // ✅ get controller
    return Column(
      children: [
        TextField(
          controller: controller.email,
          decoration: const InputDecoration(
            labelText: "Email",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.password,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: "Password",
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            controller.loginUser(
              context,
              controller.email.text.trim(),
              controller.password.text.trim(),
            );
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}
