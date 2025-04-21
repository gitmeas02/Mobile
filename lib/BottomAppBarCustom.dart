import 'package:flutter/material.dart';

class BottomAppBarCustom extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  BottomAppBarCustom({super.key, 
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.pie_chart_outline,
    Icons.person_outline,
  ];

  final List<String> labels = [
    'Home',
    'Wallet',
    'Stats',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(icons.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onTabSelected(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icons[index],
                color: isSelected ? Colors.blueAccent : Colors.white60,
              ),
              Text(
                labels[index],
                style: TextStyle(
                  color: isSelected ? Colors.blueAccent : Colors.white60,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isSelected)
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  height: 2,
                  width: 20,
                  color: Colors.blueAccent,
                ),
            ],
          ),
        );
      }),
    );
  }
}
