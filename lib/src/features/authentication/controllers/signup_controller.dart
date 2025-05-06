import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/features/authentication/screens/login/login.dart';
import 'package:psm_coding_files/src/custom_dialogs/custom_dialogs.dart'; // Assuming you have custom dialog methods here

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  var isPasswordHidden = true.obs;
  void togglePasswordVisibility() => isPasswordHidden.toggle();

  Future<void> registerUser(String email, String password, BuildContext context) async {
    try {
      await AuthenticationRepository.instance.registerUserWithEmailAndPassword(email, password);

      // ✅ Send email verification
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();

      // ✅ Immediately sign out the user after sending verification
      await FirebaseAuth.instance.signOut();

      // Show success dialog
      _showSuccessDialog(context, email);

      // ✅ After 2 seconds, navigate to login page
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => const LoginScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500));
      });
    } catch (e) {
      // Show error dialog if registration fails
      _showErrorDialog(context, e.toString());
    }
  }

  // Success dialog after signup
  void _showSuccessDialog(BuildContext context, String email) {
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
                "Account Created Successfully!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "A verification email has been sent to $email. Please verify before logging in.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text("Go to Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Error dialog for any issues
  void _showErrorDialog(BuildContext context, String errorMessage) {
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
                Icons.error,
                color: Colors.red,
                size: 60.0,
              ),
              const SizedBox(height: 20),
              const Text(
                "Signup Failed",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
