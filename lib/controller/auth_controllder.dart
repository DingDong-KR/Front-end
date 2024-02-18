import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<String> userId = Rx<String>('');

  void updateUserId(String newUserId) {
    userId.value = newUserId;
  }
}
