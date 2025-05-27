import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final ImageIcon icon;
  final String colorButton;
  final String textColor;
  const ButtonWidget({super.key, required this.text, required this.icon, required this.colorButton, required this.textColor});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        decoration: BoxDecoration(
          color: _getButtonColor(colorButton),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 10),
            Text(text,
              style: TextStyle(
                color: Color(int.parse(textColor)),
                fontSize: 14,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(String colorName) {
    switch (colorName) {
      case 'buttonColor1':
        return AppColors.buttonColor1;
      case 'buttonColor2':
        return AppColors.buttonColor2;
      case 'buttonColor3':
        return AppColors.buttonColor3;
      case 'buttonColor4':
        return AppColors.buttonColor4;
      default:
        return AppColors.buttonColor1;
    }
  }
}