import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItem {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final String iconPath; // Store the path to the SVG file

  MenuItem({
    required this.title,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    required this.iconPath,
  });
}


final List<MenuItem> menuItems = [
  MenuItem(
    title: '홈',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    iconPath: 'assets/icons/icon_home.svg',
  ),
  MenuItem(
    title: '예진',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    iconPath: 'assets/icons/icon_chart.svg',
  ),
  MenuItem(
    title: '본진',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    iconPath: 'assets/icons/icon_cross.svg',
  ),
  MenuItem(
    title: '침구',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    iconPath: 'assets/icons/icon_bed.svg',
  ),
  MenuItem(
    title: '약제',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    iconPath: 'assets/icons/icon_pill.svg',
  ),
  MenuItem(
    title: '아카이브',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    iconPath: 'assets/icons/icon_box.svg',
  ),
];