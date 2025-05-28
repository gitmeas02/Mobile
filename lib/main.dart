import 'package:flutter/material.dart';
import 'package:login/features/auth/presentation/page/signup_page.dart';

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
      title:'Blog App',
      debugShowCheckedModeBanner: false,
      home: const SignupPage()
    );
  }
}
