import 'package:flutter/material.dart';

class MainSymptom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 629,
          height: 312,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}