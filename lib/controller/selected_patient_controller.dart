import 'package:get/get.dart';

class SelectedPatientController extends GetxController {
  RxInt patientNumber = RxInt(0);

  void setPatientNumber(int number) {
    patientNumber.value = number;
  }
}