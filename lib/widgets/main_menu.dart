import 'package:flutter/material.dart';
import 'menu_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 122,
          height: 684,
          decoration: BoxDecoration(color: Color(0xFFE4F8EF)),
          child: Column(
            children: [
              // 첫 번째 아이템
              SizedBox(
                height: 50.0, // TODO: 피그마에서는 29이지만 29로하면 너무 작아져서 비율 임의 수정함
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      SizedBox(width: 8.0),
                      Text(
                        menuItems.first.title,
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: menuItems.first.fontSize,
                          fontFamily: 'Pretendard',
                          fontWeight: menuItems.first.fontWeight,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // 2번째 부터 메뉴 아이템 가져와서 넣기
              for (var i = 1; i < menuItems.length - 1; i++)
                SizedBox(
                  height: 35.0, // TODO: 피그마에서는 29이지만 29로하면 너무 작아져서 비율 임의 수정함
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        // 아이콘
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              menuItems[i].iconPath,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // 텍스트
                        Text(
                          menuItems[i].title,
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: menuItems[i].fontSize,
                            fontFamily: 'Pretendard',
                            fontWeight: menuItems[i].fontWeight,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              // 빈 공간 채우기
              Spacer(),
              // 마지막 메뉴인 설정이 들어가는 부분
              Container(
                margin: EdgeInsets.only(bottom: 14.0), // 바텀 마진값
                child: SizedBox(
                  height: 26.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 6.0), // 왼쪽 마진 값 조절
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        // 아이콘
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              menuItems.last.iconPath,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // 텍스트
                        Text(
                          menuItems.last.title,
                          style: TextStyle(
                            color: Color(0xFF404855),
                            fontSize: menuItems.last.fontSize,
                            fontFamily: 'Pretendard',
                            fontWeight: menuItems.last.fontWeight,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
