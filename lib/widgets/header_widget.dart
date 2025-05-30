import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});
   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        leadingWidth: 153,
        actionsPadding: EdgeInsets.symmetric(horizontal: 18),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Image.asset('assets/images/logo.png'),
        scrolledUnderElevation: 0.0,
        actions: [
          Row(
              children: [
                Icon(Icons.search,size:24, color:AppColors.iconColor ),
                SizedBox(width: 2),
                Icon(Icons.person,size:24, color:AppColors.iconColor ),
              ],
              
            )
        ],
      );
  }
}