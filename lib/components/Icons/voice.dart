import 'package:flutter/material.dart';

class Voice extends StatefulWidget {
  const Voice({super.key});
  @override
  State<Voice> createState() => _Voice();
}

class _Voice extends State<Voice> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Add functionality here
      },
      iconSize: 24, // Adjusted size for better visibility
      icon: const Icon(
        Icons.mic, // Changed to a microphone icon for relevance
        color: Colors.blue, // Added color for better appearance
      ),
      padding: const EdgeInsets.all(12.0), // Adjusted padding for balance
      tooltip: 'Voice Input', // Added tooltip for accessibility
    );
  }
}