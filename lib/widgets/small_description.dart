import 'package:flutter/material.dart';

class SmallDescriptionWidget extends StatelessWidget {
  const SmallDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Discover industry-leading courses designed to equip you\nwith real-world skills. Join our community and start your',
          ),
          Text('journey to success today.'),
        ],
      ),
    );
  }
}
