

import 'package:flutter/material.dart';

class NavBarItem {
  final IconData iconData;
  final double size;
  final String text;
  final Color selectedColor;


  NavBarItem({
    required this.iconData,
    required this.size,
    required this.selectedColor ,
    required this.text,
  });
}
