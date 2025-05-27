import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              width: 200,
              height: 200, // smaller than image height
              decoration: BoxDecoration(
                color: AppColors.backgroundHero,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Image.asset(
            'assets/images/avatar.png',
            width: 250.38,
            height: 258.21,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}