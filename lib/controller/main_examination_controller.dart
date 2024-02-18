import 'package:get/get.dart';

class MainExaminationController extends GetxController {
  Rx<String> treatRecord = Rx<String>('');

  void updateTreatRecord(String newTreatRecord) {
    treatRecord.value = newTreatRecord;
    update();
    print('컨트롤러의 주증상: ${treatRecord.value}');
  }
}
