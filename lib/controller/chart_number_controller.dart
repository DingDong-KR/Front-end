import 'package:get/get.dart';

class ChartNumberController extends GetxController {
  RxInt chartNumber = RxInt(0);

  void setChartNumber(int number) {
    chartNumber.value = number;
    print('차트넘버:${chartNumber.value}');
  }
}