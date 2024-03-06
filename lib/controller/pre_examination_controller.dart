import 'package:get/get.dart';

class PreExaminationController extends GetxController {
  Rx<String> mainSymptom = Rx<String>('');
  Rx<String> nursingNote = Rx<String>('');

  void updateMainSymptom(String newMainSymptom) {
    mainSymptom.value = newMainSymptom;
    update();
    print('컨트롤러의 주증상: ${mainSymptom.value}');
  }

  void updateNursingNote(String newNursingNote) {
    nursingNote.value = newNursingNote;
    update();
    print('컨트롤러의 간호노트: ${nursingNote.value}');
  }
}
