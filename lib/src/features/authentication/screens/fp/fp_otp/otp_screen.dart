import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psm_coding_files/src/features/authentication/controllers/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpController otpController = Get.put(OtpController());
    var otp ;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP\nCODE',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Text('Please Enter OTP Number', textAlign: TextAlign.center),
            const SizedBox(height: 20),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.2),
              filled: true,
              onSubmit: (code) {
                otp = code;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                    OtpController.instance.verifyOTP(otp);
                    },
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
