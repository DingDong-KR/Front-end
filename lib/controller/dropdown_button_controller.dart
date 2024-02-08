import 'package:get/get.dart';

enum DropdownMenu { DEFAULT, MENU1, MENU2 }

extension DropdownMenuExtension on DropdownMenu {
  String get name {
    switch (this) {
      case DropdownMenu.DEFAULT:
        return "그룹 선택";
      case DropdownMenu.MENU1:
        return "봉사동아리 1";
      case DropdownMenu.MENU2:
        return "봉사동아리 2";
    }
  }
}


class DropdownButtonController extends GetxController {
  Rx<DropdownMenu> currentItem = DropdownMenu.DEFAULT.obs;
  void changeDropdownMenu(int? itemIndex){
    var selectedItem =
        DropdownMenu.values.where((menu) => menu.index == itemIndex).first;
    currentItem(selectedItem);
  }
}