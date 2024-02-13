import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientsItem {
  final String sequence; // 본진인지 침구인지
  final int order; // 환자 순서? 번호?
  final String name;
  final String sex;
  final int age;
  final List<String> symptoms; // Change to List<String>
  final String status; // 진료중, 응급, 대기중
  final DateTime time; // Change to DateTime

  PatientsItem({
    required this.sequence,
    required this.order,
    required this.name,
    required this.sex,
    required this.age,
    required this.symptoms, // Change to List<String>
    required this.status,
    required this.time, // Change to DateTime
  });
}

// Define your menu items
final List<PatientsItem> patientsItems = [
  PatientsItem(
    sequence: "본진", // 본진인지 침구인지
    order: 2, // 환자 순서? 번호?
    name: "이수민",
    sex: "여",
    age: 52,
    symptoms: ["다리아픔"],
    status: "진료중",
    time: DateTime.parse("1969-07-20 20:18:04Z"),
  ),
  PatientsItem(
    sequence: "침구", // 본진인지 침구인지
    order: 8, // 환자 순서? 번호?
    name: "김빵빵",
    sex: "남",
    age: 31,
    symptoms: ["팔아픔"],
    status: "대기",
    time: DateTime.parse("1979-07-20 20:18:04Z"),
  ),
];