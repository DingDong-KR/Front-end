import 'package:get/get.dart';

class AddVitalButtonController extends GetxController {
  RxBool isButtonPressed = RxBool(false);

  void updateButtonPressed() {
    isButtonPressed.value = !isButtonPressed.value;
    print("얌마 ${isButtonPressed.value}");
  }
}
