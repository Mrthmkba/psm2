import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageColor,
    this.imageHeight =0.2,
    this.heightBetween,
    this.textAlign,
  });

  final String image,title,subTitle;
  final Color? imageColor;
  final TextAlign? textAlign;
  final double imageHeight;
  final double? heightBetween;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 30,),
        Image(image:AssetImage(image),height: size.height * 0.2,),
        const SizedBox(height: 20,),
        Text(title,textAlign: textAlign,style: Theme.of(context).textTheme.headlineLarge,),

        Text(subTitle,textAlign: textAlign,style: Theme.of(context).textTheme.titleLarge,),
      ],
    );
  }
}