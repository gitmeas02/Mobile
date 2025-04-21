import 'package:flutter/material.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? textStyle;

  const Header({
    super.key,
    required this.title,
    this.textStyle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HeaderState createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  bool isClearAll = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF6941C6),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isClearAll = !isClearAll;
                  });
                },
                child: Icon(
                  isClearAll ? Icons.clear_all_rounded : Icons.clear_sharp,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: widget.textStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Icon(Icons.add, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
