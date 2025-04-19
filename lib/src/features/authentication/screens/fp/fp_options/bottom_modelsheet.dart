import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/features/authentication/screens/fp/fp_email/fp_mail.dart';

import '../../../../../utils/text_settings.dart';
import 'fp_button.dart';

class FpScreen{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(FPTitle,style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),),
            // Added spacing between title and subtitle
            Text(FPSubTitle),
            SizedBox(height: 10),
            FPButton(

              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FPMailPage()),
                );},
              title: RVE,
              subtitle: RVESub,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 8),
            FPButton(
              onTap: () {  },
              btnIcon: Icons.phone,
              title: RVP,
              subtitle: RVPSub,
            ),
          ],
        ),
      ),
    );
  }
}