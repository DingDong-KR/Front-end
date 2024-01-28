import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientsItem {
  final String sequence; // 본진인지 침구인지
  final int order; // 환자 순서? 번호?
  final String name;
  final String sex;
  final int age;
  final List<String> symptoms;
  final String status; // 진료중, 응급, 대기중
  final DateTime time; // parsing 필요

  PatientsItem({
    required this.sequence,
    required this.order,
    required this.name,
    required this.sex,
    required this.age,
    required this.symptoms,
    required this.status,
    required this.time,
  });
}
