import 'package:flutter/material.dart';

class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure("Please Enter a STRONG Password.");

      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure("Please Enter a valid Email.");

      case 'email-already-used':
        return const SignUpWithEmailAndPasswordFailure("This email has been taken, try another one.");

      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure("Please contact support.");

      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure("You are disabled,contact support.");

      default :
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

}