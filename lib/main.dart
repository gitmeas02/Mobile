import 'package:flutter/material.dart';

import 'components/Icons/voice.dart';
import 'components/SegmentedButton/MultipleChoice.dart';
import 'components/SegmentedButton/SingleChoice.dart';
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
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor:const Color(0xFF008000),
        toolbarHeight: 40,
        ),
        body: Center(
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const <Widget>[
        SizedBox(height: 4),
        Text('Single choice'),
        SingleChoice(),
        SizedBox(height: 20),
        Text('Multiple choice'),
        MultipleChoice(),
        SizedBox(height: 20),
        Text("Voice Icon"),
        Voice()
      ],
    ),
),

      ),
    );
  }
}
