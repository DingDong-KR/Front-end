import 'package:get/get.dart';

class DropdownButtonController extends GetxController {
  Rx<String?> currentItem = Rx<String?>(null);
  RxList<String> menuItems = <String>[].obs;

  void changeDropdownMenu(String? selectedItem){
    currentItem.value = selectedItem;
  }
  void updateMenuItems(List<String> items) {
    menuItems.assignAll(items);
  }
}
