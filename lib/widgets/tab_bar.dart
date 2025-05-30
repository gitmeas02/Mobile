import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';
import 'package:tp4_flutter/widgets/categories/category_card.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  final List<Map<String, dynamic>> itemData = const [
    {
      'image': 'assets/images/microsoftword.png',
      'article': 'Course',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'John',
      'level': 'កំរិតដំបូង',
      'students': 99,
      'location': 'ITC',
      'status': 'Available',
      'price': 25,
    },
    {
      'image': 'assets/images/microsoftword.png',
      'article': 'Educator',
      'profileImage': 'assets/images/hongly.png',
      'name': 'Alice',
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'students': 99,
      'status': 'Busy',
      'price': 25,
    },
    {
      'image': 'assets/images/microsoftword.png',
      'article': 'Resource',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'Alice',
      'students': 99,
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'status': 'Busy',
      'price': 25,
    },
    {
      'image': 'assets/images/hoktin.png',
      'article': 'Extra',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'Alice',
      'students': 99,
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'status': 'Busy',
      'price': 99,
    },
    {
      'image': 'assets/images/hoktin.png',
      'article': 'Extra',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'Alice',
      'students': 99,
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'status': 'Busy',
      'price': 99,
    },
    {
      'image': 'assets/images/hoktin.png',
      'article': 'Extra',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'Alice',
      'students': 99,
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'status': 'Busy',
      'price': 99,
    },
    {
      'image': 'assets/images/hoktin.png',
      'article': 'Extra',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'Alice',
      'students': 99,
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'status': 'Busy',
      'price': 99,
    },
    {
      'image': 'assets/images/hoktin.png',
      'article': 'Extra',
      'profileImage': 'assets/images/khunmeas.png',
      'name': 'Alice',
      'students': 99,
      'level': 'កំរិតដំបូង',
      'location': 'ITC',
      'status': 'Busy',
      'price': 99,
    },
    // Add more items as needed
  ];

  Widget buildFilteredGrid(String category) {
  final filteredItems =
      itemData.where((item) => item['article'] == category).toList();
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: filteredItems.map((item) => CategoryCard(
          image: item['image'],
          article: item['article'],
          profileImage: item['profileImage'],
          name: item['name'],
          status: item['status'],
          students: item['students'],
          level: item['level'],
          location: item['location'],
          price: item['price'],
        )).toList(),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            automaticIndicatorColorAdjustment: false,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            // labelPadding: EdgeInsets.symmetric(vertical: 4.0),
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            indicatorColor: AppColors.buttonColor2,
            splashFactory: NoSplash.splashFactory,
            indicatorSize: TabBarIndicatorSize.tab,
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
              Tab(text: 'Extra'),
              Tab(text: 'Resources'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            child: TabBarView(
              children: [
                buildFilteredGrid('Course'),
                buildFilteredGrid('Educators'),
                buildFilteredGrid('Extra'),
                buildFilteredGrid('Resources'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
