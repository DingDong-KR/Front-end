import 'package:get/get.dart';

class DropdownButtonController extends GetxController {
  Rx<String> currentItem = Rx<String>(''); // Initialize with a non-null value
  RxList<String> menuItems = <String>[].obs;

  void changeDropdownMenu(String? selectedItem){
    currentItem.value = selectedItem ?? ''; // Handle null values
  }

  void updateMenuItems(List<String> items) {
    menuItems.assignAll(items);
  }
}
