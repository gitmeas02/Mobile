import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;

  const Header({
    Key? key,
    required this.title,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      color: const Color(0xFF6941C6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.white), // Menu icon on the left
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ), // Centered text
          Icon(Icons.add, color: Colors.white), // "+" sign on the right
        ],
      ),
    );
  }
}
