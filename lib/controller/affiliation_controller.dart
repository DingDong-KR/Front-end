import 'package:get/get.dart';

class AffiliationController extends GetxController {
  Rx<String> currentAffiliation = Rx<String>(''); // Initialize with a non-null value
  RxList<String> affiliations = <String>[].obs;

  void changeSelectedAffiliation(String? selectedItem){
    currentAffiliation.value = selectedItem ?? ''; // Handle null values
  }

  void updateMenuItems(List<String> items) {
    affiliations.assignAll(items);
  }
}
