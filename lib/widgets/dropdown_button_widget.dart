import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_desktop_app/controller/dropdown_button_controller.dart';
import 'package:my_desktop_app/controller/dropdown_button_controller.dart'
    as my_controller;

class DropdownButtonWidget extends GetView<DropdownButtonController> {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        offset: Offset(-80, 35), // 수정
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            0),
        onSelected: (int value) {
          controller.changeDropdownMenu(value);
        },
        elevation: 0,
        itemBuilder: (BuildContext context) {
          return my_controller.DropdownMenu.values
              .map(
                (menu) => PopupMenuItem(
                  value: menu.index,
                  height: 30, // 수정: 메뉴 항목의 높이 설정
                  child: Center(child: Text(menu.name)),
                ),
              )
              .toList();
        },
        child: Obx(
          () => Container(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 수정
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.currentItem.value.name,
                  textAlign: TextAlign.right, // 수정
                ),
                SizedBox(width: 5,),
                SvgPicture.asset('assets/icons/icon_down_arrow.svg')
              ],
            ),
          ),
        ));
  }
}
