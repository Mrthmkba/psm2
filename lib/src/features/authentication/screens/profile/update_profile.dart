import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:psm_coding_files/src/constants/colors.dart';
import 'package:psm_coding_files/src/features/authentication/screens/profile/profile_screen.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.to(() => const ProfileScreen()),
            icon: const Icon (LineAwesomeIcons.angle_left_solid)),
        title: Text("Edit Profile", style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(110),child: const Image(image: AssetImage("assets/logo/profile.png"),)
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(95),
                        color: Colors.blueGrey.withOpacity(0.1),
                      ),
                      child: const Icon(LineAwesomeIcons.camera_solid,size: 20, color: Colors.black,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50,),
              Form(child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Full Name'),
                      hintText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      prefixIcon: Icon(Icons.person_3_outlined),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Phone No'),
                      hintText: "Phone Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      prefixIcon: Icon(Icons.phone_android_outlined),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                      ),
                      prefixIcon: Icon(Icons.fingerprint_outlined),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const UpdateProfilePage() ),
                      style:  ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        side: BorderSide.none,shape: const StadiumBorder()
                      ),
                      child: const Text('Edit Profile'),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text.rich(TextSpan(
                  //       text: 'Joined',
                  //       style: TextStyle(fontSize: 14),
                  //       children: [
                  //         TextSpan(text: 'Joined At', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
                  //       ]
                  //     ),
                  //     ),
                  //     ElevatedButton(onPressed: (){},
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.redAccent.withOpacity(0.1)
                  //         ),
                  //         child: null,
                  //     ),
                  //   ],
                  // )
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
