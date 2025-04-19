import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psm_coding_files/src/auth_repo/authentication_repository.dart';
import 'package:psm_coding_files/src/features/authentication/screens/Reminder/reminders_list.dart';
import 'package:psm_coding_files/src/features/authentication/screens/Welcome/welcome_screen.dart';
import 'package:psm_coding_files/src/features/authentication/screens/profile/profile_screen.dart';
import '../chatbot/chat_page.dart';
import '../profile/update_profile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon: const Icon (Icons.menu_sharp,color: Color(0xFFBD58DC)),
        onPressed:() => Get.to(() => const ProfileScreen()),
        ),
        title: const Text("  ", style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: const MyMainPage(),

          ),
      ),
    );
  }
}

class MyMainPage extends StatelessWidget{
  const MyMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Padding(
              padding: EdgeInsets.all(35.0),
              child:
              Image(image: AssetImage("assets/logo/MainLogo1.png")),
            ),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: OutlinedButton(
                onPressed:(){
                  // Navigate to the new screen when button is pressed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  // );
                  Get.to(() => const ChatScreen());
                } ,
                child: const Text("Ask Ai",
                style: TextStyle(
                fontSize: 28,
                fontStyle: FontStyle.normal),),),),
            const SizedBox(height: 20,),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: OutlinedButton(
                onPressed:(){
                  // Navigate to the new screen when button is pressed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  // );



                } ,
                child: const Text("Scan Medicine",
                  style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.normal),),),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 55,
              width: double.infinity,
              child: OutlinedButton(
                onPressed:(){
                  // Navigate to the new screen when button is pressed
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                  // );
                  Get.to(() => ReminderListPage());
                } ,
                child: const Text("My Reminder",
                  style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.normal),),),
            ),
          ],
        );
  }

}