import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class QuoteText extends StatelessWidget {
  const QuoteText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              text: 'Unlock Your Potential \nwith ',
              style: const TextStyle(
              fontFamily:'Georgia',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 28,
              letterSpacing: 0,
              color: Colors.black,
              ),
              children: [
              TextSpan(
              text: 'Worktency',
              style: TextStyle(
              fontFamily: 'Georgia',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              height: 1.0,
              letterSpacing: 0,
              color: AppColors.text1,),
              ),
            ],
            ),
);
  }
}