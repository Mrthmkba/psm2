import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // TextField Controllers
  final email = TextEditingController();
  final password = TextEditingController();

  // function to call in the form
  void loginUser(String email, String password) {
    AuthenticationRepository.instance.loginUser(email, password); // ✅ correct method
  }
}
