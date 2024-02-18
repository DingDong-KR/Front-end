import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrderSet extends StatelessWidget {
  const OrderSet({Key? key}) : super(key: key);

  Widget _buildContainer(String assetName, String text) {
    return Container(
      width: 215,
      height: 9,
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
                child: SvgPicture.asset(assetName),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Color(0xFF404855),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                  letterSpacing: 0.12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 205,
        height: 370,
        padding: const EdgeInsets.all(15),
        decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '오더세트',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                    letterSpacing: 0.14,
                  ),
                ),
                Spacer(),
                SvgPicture.asset('assets/icons/icon_add.svg')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  width: 215,
                  height: 22,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF7F7F7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(6, 0, 0, 3),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '오더세트를 검색하세요',
                          hintStyle: TextStyle(
                            color: Color(0xFFAFAFAF),
                            fontSize: 11,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 2,
                  child: SvgPicture.asset('assets/icons/icon_search.svg'),
                ),
              ],
            ),
            SizedBox(height: 10,),
            _buildContainer('assets/icons/icon_filled_heart.svg', '즐겨찾기(2)'),
            SizedBox(height: 10,),
            _buildContainer('assets/icons/icon_folder.svg', 'Order Set(1)'),
            SizedBox(height: 10,),
            _buildContainer('assets/icons/icon_folder.svg', 'Order Set(2)'),
          ],
        ));
  }
}
