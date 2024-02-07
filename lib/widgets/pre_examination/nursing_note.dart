import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NusrsingNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 313,
          height: 259,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Row 내 자식들을 시작점에 맞추기
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      '간호노트',
                      style: TextStyle(
                        color: Color(0xFF404855),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1,
                        letterSpacing: 0.12,
                      ),
                    ),
                    SizedBox(width: 5,),
                    SvgPicture.asset('assets/icons/icon_pencil.svg'),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
