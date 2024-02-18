import 'package:get/get.dart';

class PreExaminationController extends GetxController {
  Rx<String> mainSymptom = Rx<String>('');

  void updateMainSymptom(String newMainSymptom) {
    mainSymptom.value = newMainSymptom;
    update();
    print('컨트롤러의 주증상: ${mainSymptom.value}');
  }
}
