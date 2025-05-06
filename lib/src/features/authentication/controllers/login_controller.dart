import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/features/authentication/screens/dashboard/main_page.dart';

import '../../../custom_dialogs/custom_dialogs.dart'; // ✅ import your MainPage

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginUser(BuildContext context, String email, String password) async {
    try {
      // Attempt login
      await AuthenticationRepository.instance.loginUser(email, password);

      // Check if user is verified
      final user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await FirebaseAuth.instance.signOut();
        showErrorDialog(context, "Email Not Verified", "Please verify your email before logging in.");
        return;
      }

      // Login success popup
      showSuccessDialog(context, "Login Successful", "Welcome back!");

      // Navigate after slight delay
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const MainPage());
      });

    } catch (e) {
      // Show error popup
      showErrorDialog(context, "Login Failed", e.toString());
    }
  }
}
