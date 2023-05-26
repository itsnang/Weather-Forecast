import 'package:flutter/material.dart';
import 'package:to_do_list/controllers/authController.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthController auth = Get.put(AuthController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('en'));
              },
              child: Text('Englist')),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('km'));
              },
              child: Text('Khmer')),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                auth.singOut();
              },
              child: Text('sign_out'.tr),
            ),
          ),
        ],
      ),
    );
  }
}
