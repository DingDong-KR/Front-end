import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      height: 267,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                '이미지',
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0.11,
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(height: 15,),
          Expanded(
            child: Container(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFADE9F9)),
                ),
              ),
              child: Image.asset('assets/images/image_human_body.jpg'),
              ),
            ),
          SizedBox(height: 15,),
          Row(
            children: [
              Spacer(),
              Text(
                '1개의 이미지 중 1-1',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 10,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.15,
                  letterSpacing: 0.10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SvgPicture.asset('assets/icons/icon_arrow_left_gray.svg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: SvgPicture.asset('assets/icons/icon_arrow_right_gray.svg'),
              ),
            ],
          )
        ],
      ),
    );
  }
}