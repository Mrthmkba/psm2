import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/utils/text_settings.dart';

import '../../../../../common_widget/forms/form_header.dart';

class FPMailPage extends StatelessWidget {
  const FPMailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                SizedBox(height: 20 * 3),
                FormHeader(
                  image: "assets/logo/fp.jpg",
                  title: FPTitle,
                  subTitle: FPSubTitle,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(Email),
                        hintText: Email,
                        prefixIcon: Icon(Icons.mail_outline_rounded)
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(width: double.infinity,
                    child: ElevatedButton(onPressed: (){},
                    child: const Text('Nest'),),)
                  ],
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
