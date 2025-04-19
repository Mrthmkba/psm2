import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/features/authentication/screens/login/login.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final fullName = TextEditingController(); // ✅ Add this line
  final email = TextEditingController();
  final password = TextEditingController();

  var isPasswordHidden = true.obs;
  void togglePasswordVisibility() => isPasswordHidden.toggle();

  Future<void> registerUser(String email, String password) async {
    try {
      await AuthenticationRepository.instance.registerUserWithEmailAndPassword(email, password);

      Get.snackbar(
        "Success",
        "Account created! Please verify your email.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate with animation
      Future.delayed(const Duration(seconds: 2), () {
        Get.off(() => const LoginScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
      });
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
