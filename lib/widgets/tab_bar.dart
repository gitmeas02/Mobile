import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

 @override
Widget build(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Column(
      children: [
        TabBar(
          dividerColor:Colors.transparent,
          automaticIndicatorColorAdjustment: false,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          // labelPadding: EdgeInsets.symmetric(vertical: 4.0),
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          indicatorColor: AppColors.buttonColor2,
          splashFactory: NoSplash.splashFactory,
          indicatorSize:TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.only(bottom: 10),
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(
              color: AppColors.buttonColor2,
              width: 1.0,
            ),
            insets: const EdgeInsets.symmetric(horizontal: 10),
          ),
          tabs: const [
            Tab(text: 'Course Courses'),
            Tab(text: 'Educators'),
            Tab(text: 'Resources'),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: const TabBarView(
            children: [
              Center(child: Text('Course Courses')),
              Center(child: Text('Educators')),
              Center(child: Text('Resources')),
            ],
          ),
        ),
      ],
    ),
  );
}
}
