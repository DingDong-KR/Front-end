import 'package:flutter/material.dart';
import 'package:my_desktop_app/screens/ros_temperature_sensitive.dart';
Widget _buildRosItem(String text) {
  return Container(
    width: 171,
    height: 32,
    margin: EdgeInsets.symmetric(vertical: 5),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xFFD3D3D3)),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF404855),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),

      ],
    ),
  );
}

class AddRosScreen extends StatelessWidget {
  const AddRosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> rosItems = [
      "추위/더위", "땀/음수", "기호", "식욕/소화", "대변", "소변", "심흉", "수면",
      "부녀", "두면/견항/인후", "전신", "관절", "감기", "컨디션"
    ];

    return Container(
      width: 1124,
      height: 627,
      decoration: ShapeDecoration(
        color: Color(0xFFE2F1F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            width: 191,
            height: 607,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                for (String item in rosItems)
                  _buildRosItem(item),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,8,8,0),
                child: Container(
                  width: 903,
                  height: 46,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 903,
                height: 573,
                decoration: ShapeDecoration(
                  color: Color(0xFFD3E8F0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RosTemperatureSensitive(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
