import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class HeaderWidget extends StatelessWidget {
  static final image = 'assets/images/logo.png';
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
       margin: const EdgeInsets.only(top: 20),
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.boder1,
            width: 1.0,
          )
          
        ),
       alignment: Alignment.center,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Image.asset(image, width: 152.4, height: 30,),
            Row(
              children: [
                Icon(Icons.search,size:24, color:AppColors.iconColor ),
                SizedBox(width: 2),
                Icon(Icons.person,size:24, color:AppColors.iconColor ),
              ],
              
            )
          ],),
        ),
      );
  }
}