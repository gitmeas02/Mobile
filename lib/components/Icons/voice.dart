
import 'package:flutter/material.dart';

class Voice extends StatefulWidget{
  const Voice({super.key});
  @override
  State<Voice> createState()=> _Voice();
}
class _Voice extends State<Voice>{

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){},
    iconSize: 72,
    icon: const Icon(Icons.favorite),
    );
  }
}