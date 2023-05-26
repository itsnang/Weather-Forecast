import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/authController.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';

class AppControll extends StatelessWidget {
  final AuthController autCtrl = Get.put(AuthController());
  AppControll({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (autCtrl.isLogin == true) {
        return HomeScreen();
      } else {
        return LoginScreen();
      }
    });
  }
}
