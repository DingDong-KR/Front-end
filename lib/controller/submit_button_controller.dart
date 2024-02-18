import 'package:get/get.dart';

class SubmitButtonController extends GetxController {
  RxBool isVitalButtonPressed = RxBool(false);
  RxBool isPreExaminationButtonPressed = RxBool(false);
  RxBool isRosButtonPressed = RxBool(false);

  void vitalButtonPressed() {
    isVitalButtonPressed.value = !isVitalButtonPressed.value;
    update();
  }

  void preExaminationButtonPressed() {
    isPreExaminationButtonPressed.value = !isPreExaminationButtonPressed.value;
    update();
  }

  void rosButtonPressed() {
    isRosButtonPressed.value = !isRosButtonPressed.value;
  }
}
