import 'package:flutter/material.dart';
import 'Header.dart';
import 'BottomAppBarCustom.dart';
import 'pages/HomePage.dart';
import 'pages/ProfilePage.dart';
import 'pages/StatePage.dart';
import 'pages/WalletPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    WalletPage(),
    StatePage(),
    ProfilePage(),
  ];

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        body: Column(
          children: [
            const Header(title: "This is me"),
            Expanded(child: pages[selectedIndex]),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
            child: BottomAppBarCustom(
              selectedIndex: selectedIndex,
              onTabSelected: onTabSelected,
            ),
          ),
        ),
      ),
    );
  }
}
