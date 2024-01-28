import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
import '../screens_main/archive_screen.dart';
import '../screens_main/bedding_screen.dart';
import '../screens_main/home_screen.dart';
import '../screens_main/main_examination_screen.dart';
import '../screens_main/medicines_screen.dart';
import '../screens_main/pre_examination_screen.dart';
import 'menu_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientsList extends StatelessWidget {
  const PatientsList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 635,
      width: 244,
      decoration: BoxDecoration(color: Color(0xFF181818)),
      child: ListView(children: [
        // Your list items...
      ]),
    );
  }
}

