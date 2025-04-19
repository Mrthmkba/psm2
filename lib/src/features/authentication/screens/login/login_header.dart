import 'package:flutter/material.dart';

import '../../../../utils/text_settings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Image(image: AssetImage("assets/logo/MainLogo1.png"),),
        ),
        SizedBox(height: 20,),
        // Text(LoginTitle,style: Theme.of(context).textTheme.headlineLarge,),
        //
        // Text(LoginSubTitle,style: Theme.of(context).textTheme.titleLarge,),
      ],
    );
  }
}