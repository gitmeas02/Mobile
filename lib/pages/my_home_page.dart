import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/pages/audio_music.dart';

import '../audio/app_colors.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List popularBooks = [];
  List books=[];
  late ScrollController _scrollController;
  late TabController _tabController;
  int selectedIndex = 0;
  final List<String> tabsLabel = ["New", "Top", "Best", "Popular"];
  readData() async {
    await DefaultAssetBundle.of(
      context,
    ).loadString("json/popularBooks.json").then((s) {
      setState(() {
        popularBooks = json.decode(s);
      });
    });
  }
  readData2() async {
    await DefaultAssetBundle.of(
      context,
    ).loadString("json/books.json").then((s){
      setState((){
        books = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabsLabel.length, vsync: this);
    _scrollController = ScrollController();
    readData();
    readData2();
    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        setState(() {
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.AppColors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage("images/menu.png"),
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: [
                        // ImageIcon(AssetImage("images/alarm.png"),size:24,color:Colors.black),
                        // ImageIcon(AssetImage("images/search.png"), size: 24,),
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Icon(Icons.notifications),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text("Pop Music", style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(0),
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: -20,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        height: 180,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount:
                              popularBooks == null ? 0 : popularBooks.length,
                          itemBuilder: (_, i) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(popularBooks[i]["img"]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: Colors.white,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(40),
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 10,
                              left: 20,
                              top: 10,
                            ),
                            child: TabBar(
                              dividerColor: Colors.transparent,
                              labelColor: Colors.white,
                              splashFactory: NoSplash.splashFactory,
                              tabAlignment: TabAlignment.center,
                              controller: _tabController,
                              indicatorPadding: const EdgeInsets.all(0),
                              splashBorderRadius: BorderRadius.circular(10),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding: const EdgeInsets.only(right: 10),
                              isScrollable: true,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              onTap: (index) {
                                setState(() {
                                  selectedIndex =
                                      index; // Update the selected index
                                  _tabController.animateTo(index);
                                });
                              },
                              tabs: List.generate(tabsLabel.length, (index) {
                                return Tab(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    alignment: Alignment.center,
                                    width: 120,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          selectedIndex == index
                                              ? AppColors.AppColors.menu3Color
                                              : Colors.amber,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 7,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      tabsLabel[index],
                                      style: TextStyle(
                                        color:
                                            selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount:
                            books == null ? 0 : books.length,
                        itemBuilder: (_, i) {
                          return GestureDetector(
                            onTap:(){
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Music(
                                  book: books[i],  // Pass the selected book
                                ),
                              ),
                            );
                            } ,
                            child:Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.AppColors.tabVarViewColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            books[i]["img"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color:
                                                    AppColors
                                                        .AppColors
                                                        .starColor,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                books[i]["rating"],
                                                style: TextStyle(
                                                  color:
                                                      AppColors
                                                          .AppColors
                                                          .starColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            books[i]["title"],
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontFamily: "Avenir",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            books[i]["text"],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Avenir",
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  AppColors
                                                      .AppColors
                                                      .subTitleText,
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 30,
                                            margin: const EdgeInsets.only(
                                              top: 10,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  AppColors
                                                      .AppColors
                                                      .menu3Color,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Love",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: "Avenir",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          );
                        },
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.grey),
                          title: Text("Content2"),
                        ),
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.grey),
                          title: Text("Content3"),
                        ),
                      ),
                      Material(
                        child: ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.grey),
                          title: Text("Content4"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
