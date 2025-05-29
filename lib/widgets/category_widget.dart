import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: 126,
        height: 132,
        decoration: BoxDecoration(
          color: const Color(0x176892F1), // 0x17 = 9% opacity
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/avatar2.png'),
              const SizedBox(height: 8),
              const Text(
                "Category Name",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222222), // Replace with your desired color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
