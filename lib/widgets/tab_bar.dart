import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tp4_flutter/theme/colors.dart';
import 'package:tp4_flutter/widgets/categories/category_card.dart';

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
    'location': 'RUPP',
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
    'location': 'CADT',
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
];

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildDots() {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _tabController.index == index ? AppColors.buttonColor2 : Colors.grey[300],
            ),
          );
        }),
      ),
    );
  }

  Widget buildFilteredGrid(String category) {
    final filteredItems = itemData.where((item) => item['article'] == category).toList();
    return SizedBox(
      height: 275.15, // Set height to match CategoryCard
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: filteredItems
                .map(
                  (item) => SizedBox(
                    height: 275.15, // Ensure CategoryCard height is consistent
                    child: CategoryCard(
                      image: item['image'],
                      article: item['article'],
                      profileImage: item['profileImage'],
                      name: item['name'],
                      status: item['status'],
                      students: item['students'],
                      level: item['level'],
                      location: item['location'],
                      price: item['price'],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Shrink-wrap the Column
      children: [
        TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          automaticIndicatorColorAdjustment: false,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          indicatorColor: AppColors.buttonColor2,
          splashFactory: NoSplash.splashFactory,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.only(bottom: 10),
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: AppColors.buttonColor2,
              width: 1.0,
            ),
            insets: EdgeInsets.symmetric(horizontal: 10),
          ),
          tabs: const [
            Tab(text: 'Course Courses'),
            Tab(text: 'Educators'),
            Tab(text: 'Extra'),
            Tab(text: 'Resources'),
          ],
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.64, // Optional: cap max height
          ),
          child: TabBarView(
            dragStartBehavior: DragStartBehavior.start,
            controller: _tabController,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFilteredGrid('Course'),
                    const SizedBox(height: 16),
                    buildFilteredGrid('Course'),
                    const SizedBox(height: 12),
                    buildFilteredGrid('Course'),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildFilteredGrid('Educators'),
                    const SizedBox(height: 16),
                    buildFilteredGrid('Educators'),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildFilteredGrid('Extra'),
                    const SizedBox(height: 12),
                    buildFilteredGrid('Extra'),
                    const SizedBox(height: 12),
                    buildFilteredGrid('Extra'),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildFilteredGrid('Resources'),
                    const SizedBox(height: 12),
                    buildFilteredGrid('Resources'),
                    const SizedBox(height: 12),
                    buildFilteredGrid('Resources'),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8,),
        buildDots(),
        const Text("Hello"),
      ],
    );
  }
}