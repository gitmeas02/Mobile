import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
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
        body: Center(
          child: ListView(
            // children: const [
              // Row(
              //  children: [
              //     Text('khun'),
              //     Text("This is me")
              //  ],
              // )
            // ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          
        ),
      ),
    );
  }
}
