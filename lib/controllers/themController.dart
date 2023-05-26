import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDark = false;

  @override
  void onInit() {
    changeThem();
    super.onInit();
  }

  void changeThem() {
    isDark = !isDark;
    update();
  }
}
