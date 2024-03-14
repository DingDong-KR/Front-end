import 'package:get/get.dart';

class AffiliationController extends GetxController {
  Rx<String> currentAffiliation = Rx<String>('채널 선택'); // Initialize with a non-null value
  RxList<String> affiliations = <String>[].obs;

  void changeSelectedAffiliation(String? selectedItem){
    currentAffiliation.value = selectedItem ?? ''; // Handle null values
    update();
  }

  void updateMenuItems(List<String> items) {
    affiliations.assignAll(items);
    update();
  }
}
