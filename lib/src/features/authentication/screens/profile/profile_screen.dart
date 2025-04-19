import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:psm_coding_files/src/constants/colors.dart';
import 'package:psm_coding_files/src/features/authentication/screens/dashboard/main_page.dart';
import 'package:psm_coding_files/src/features/authentication/screens/profile/update_profile.dart';

import '../../../../auth_repo/authentication_repository.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness==Brightness.dark;
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.to(() => const MainPage()),
          icon: const Icon(LineAwesomeIcons.angle_left_solid),),
        title: Text("Profile", style: Theme.of(context).textTheme.headlineLarge),

        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body:SingleChildScrollView(
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
                      child: const Icon(LineAwesomeIcons.pencil_alt_solid,size: 20, color: Colors.black,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Text('Billy Goru',style: Theme.of(context).textTheme.headlineLarge,),
              Text('goru@gmail.com',style: Theme.of(context).textTheme.bodyLarge,),
              const SizedBox(height: 10,),
              SizedBox(
                width: 180,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const UpdateProfilePage()),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,side: BorderSide.none,shape: const StadiumBorder()),
                  child: const Text('Edit Profile', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 25,),
              Divider(),
              const SizedBox(height: 10,),

              //MenuOptionsList
              ProfileMenuList(title: "Settings", icon:LineAwesomeIcons.cog_solid,onPress: (){},),
              ProfileMenuList(title: "About Us", icon:LineAwesomeIcons.long_arrow_alt_left_solid,onPress: (){},),
              const Divider(color: Colors.grey,),
              const SizedBox(height: 20,),
              ProfileMenuList(title: "Logout", icon:LineAwesomeIcons.sign_out_alt_solid,
                textColor: Colors.red,
                endIcon: false,
                onPress: (){AuthenticationRepository.instance.logout();},),

            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuList extends StatelessWidget {
  const ProfileMenuList({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }): super(key:key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? PrimaryColor : AccentColor;
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(95),
          color: Colors.purpleAccent.withOpacity(0.1),
        ),
        child:  Icon(icon, color: Colors.purpleAccent,),
      ),
      title:  Text(title, style: TextStyle(
        color: textColor,
      ),),
      trailing: endIcon? Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(95),
          color: Colors.blueGrey.withOpacity(0.1),
        ),
        child: const Icon(LineAwesomeIcons.angle_right_solid,size: 20, color: Colors.blueGrey,),
      ):null,
    );
  }
}
