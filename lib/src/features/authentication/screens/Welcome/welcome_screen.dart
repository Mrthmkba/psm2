import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/features/authentication/screens/login/login.dart';
import 'package:psm_coding_files/src/utils/text_settings.dart';

import '../signup/SignUp.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0), // Added padding for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: [
            Image.asset("assets/logo/MainLogo1.png"),
            const SizedBox(height: 20), // Added space between image and text
            Text(WelcomeTitle,style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: 10), // Added space between texts
            Text(WelcomeSubTitle,style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 30), // Added space before the buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,// Center buttons horizontally
              children: [
                SizedBox(width: double.infinity,height: 55,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent
                    ),
                    onPressed: () {
                      // Add your login navigation here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: Text(Login),
                  ),
                ),
                const SizedBox(height: 20), // Added space between buttons
                SizedBox(width: double.infinity,height: 55,
                  child: OutlinedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () {
                      // Add your sign up navigation here
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Text(SignUp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
