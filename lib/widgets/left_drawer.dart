import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {

  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.08, // 전체 화면의
          height: MediaQuery.of(context).size.height, // 전체 화면의 높이
          decoration: const BoxDecoration(color: Color(0xFFE4F8EF)),
        ),
        const Text(
          '홈',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          'A 봉사동아리',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 16,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const Text(
          '예진',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          '본진',
          style: TextStyle(
            color: Color(0xFF56A799),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const Text(
          '침구',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          '약제',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          '아카이브',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Text(
          '설정',
          style: TextStyle(
            color: Color(0xFF404855),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Container(
          width: 4,
          height: 14,
          decoration: const BoxDecoration(color: Color(0xFF56A799)),
        ),
        Container(
          width: 14.03,
          height: 12.98,
          decoration: const ShapeDecoration(
            image: DecorationImage(
              image: NetworkImage("https://via.placeholder.com/14x13"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF404855)),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.55),
          child: Container(
            width: 9.17,
            height: 15.59,
            decoration: ShapeDecoration(
              color: const Color(0xFFE5F9EF),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF404855)),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.55),
          child: Container(
            width: 9.17,
            height: 8.25,
            decoration: const ShapeDecoration(
              color: Color(0xFF404855),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 13.78,
          height: 11.27,
          child: Stack(
            children: [
              // Add your widgets inside the Stack
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

