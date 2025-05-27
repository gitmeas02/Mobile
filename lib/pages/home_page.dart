import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';
import 'package:tp4_flutter/widgets/avatar.dart';
import 'package:tp4_flutter/widgets/button_widget.dart';
import 'package:tp4_flutter/widgets/header_widget.dart';
import 'package:tp4_flutter/widgets/quote_text.dart';
import 'package:tp4_flutter/widgets/small_description.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 43.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(width: 48),
                     // Custom widget for the quote text
                    QuoteText(),
                    SizedBox(height: 22),
                    ],
                  ),
                ),
               // small decription
              SmallDescriptionWidget(),
              SizedBox(height: 21),
              // Avatar widget
              Avatar(),
              // button 2
              Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  text: 'Explore Courses',
                  icon: ImageIcon(AssetImage('assets/icons/book.png'), color: AppColors.iconColor, size: 24),
                  colorButton: 'buttonColor1',
                  textColor: AppColors.iconColor.value.toString(),
                ),
              ),
              SizedBox(height: 12),
              // button 3
              Align(
                alignment: Alignment.center,
                child: ButtonWidget(
                  text: 'Join as an educator',
                  icon: ImageIcon(AssetImage('assets/icons/learning.png'), color: AppColors.backgroundColor, size: 24),
                  colorButton: 'buttonColor2',
                  textColor: AppColors.backgroundColor.value.toString(),
                ),
              ),  
              ],
            ),
          ),
           
        ],
      ),
    );
  }
}
