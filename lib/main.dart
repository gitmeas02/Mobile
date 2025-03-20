import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/khunmeas.jpg'),
              radius: 15,
            ),
          ),
          title: Text(
            "Khun Meas",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            children: [
              // Make the CircleAvatar container clickable
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse('https://t.me/KhunMeas');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/khunmeas.jpg'),
                    radius: 180,
                  ),
                ),
              ),
              Text(
                "Welcome to My Portfolio",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Hello! I'm "),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Sean Raksmey",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: " Future Game Developer"),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Aspiring Game Developer, crafting immersive experiences for the future.",
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse('https://t.me/KhunMeas');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.blue.shade100, width: 1),
                  ),
                  child: Text(
                    "Message me",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: savePdfToDownloads,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Download CV",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    Image.asset(
                      'assets/download.png',
                      height: 20,
                      width: 20,
                      color: Colors.white,
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

 Future<void> savePdfToDownloads() async {
    try {
      // Request storage permissions (for Android 13+)
      if (Platform.isAndroid) {
        if (await Permission.manageExternalStorage.request().isDenied) {
          print('Storage permission denied');
          return;
        }
      }

      // Get the Downloads directory
      Directory? downloadsDir;
      if (Platform.isAndroid) {
        downloadsDir = Directory('/storage/emulated/0/Download');
      } else {
        downloadsDir = await getDownloadsDirectory();
      }

      if (downloadsDir == null) {
        print('Downloads directory not found');
        return;
      }

      // Define the file path in the Downloads directory
      final filePath = '${downloadsDir.path}/Resume.pdf';

      // Load the PDF from assets
      final byteData = await rootBundle.load('assets/Resume.pdf');

      // Write the PDF to the Downloads folder
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      print('✅ PDF saved to: $filePath');
    } catch (e) {
      print('❌ Error saving PDF: $e');
    }
  }

