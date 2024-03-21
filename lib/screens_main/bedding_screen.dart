import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/bedding/activity_details_bed.dart';


class BeddingScreen extends StatefulWidget {
  final int patientNumber;
  final int chartNumber;
  const BeddingScreen(
      {Key? key, required this.patientNumber, required this.chartNumber})
      : super(key: key);

  @override
  State<BeddingScreen> createState() => _BeddingScreenState();
}

class _BeddingScreenState extends State<BeddingScreen> {
  @override
  Widget build(BuildContext context) {
    return ActivityDetailsBed();
  }
}