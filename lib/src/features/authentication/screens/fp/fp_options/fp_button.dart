import 'package:flutter/material.dart';

class FPButton extends StatelessWidget {
  const FPButton({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    super.key, required this.onTap,
  });

  final IconData btnIcon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 50),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Added to align text to the left
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,
                ),),
                Text(subtitle,style: const TextStyle(color: Colors.white, fontSize: 14,
                ), // Styling added
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}