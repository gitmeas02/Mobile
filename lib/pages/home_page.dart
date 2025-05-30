import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';
import 'package:tp4_flutter/widgets/avatar.dart';
import 'package:tp4_flutter/widgets/button_widget.dart';
import 'package:tp4_flutter/widgets/category_widget.dart';
import 'package:tp4_flutter/widgets/header_widget.dart';
import 'package:tp4_flutter/widgets/quote_text.dart';
import 'package:tp4_flutter/widgets/small_description.dart';
import 'package:tp4_flutter/widgets/tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
    static final image = 'assets/images/logo.png';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar:HeaderWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 48),
            QuoteText(),
            SizedBox(height: 22),
            SmallDescriptionWidget(),
            SizedBox(height: 21),
            Avatar(),
            Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                text: 'Explore Courses',
                icon: ImageIcon(
                  AssetImage('assets/icons/book.png'),
                  color: AppColors.iconColor,
                  size: 24,
                ),
                colorButton: 'buttonColor1',
                textColor: AppColors.iconColor.value.toString(),
              ),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.center,
              child: ButtonWidget(
                text: 'Join as an educator',
                icon: ImageIcon(
                  AssetImage('assets/icons/learning.png'),
                  color: AppColors.backgroundColor,
                  size: 24,
                ),
                colorButton: 'buttonColor2',
                textColor: AppColors.backgroundColor.value.toString(),
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => Row(
                      children: [
                        CategoryWidget(),
                        if (index != 5) SizedBox(width: 9),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Courses',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            TabBarWidget(),
            
          ],
        ),
      ),
    );
  }
}
