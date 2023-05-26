import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/style_constants.dart';
import 'package:to_do_list/screens/sign_up_screen.dart';
import 'package:get/get.dart';

import '../components/text_fiel_container.dart';
import '../controllers/authController.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthController authctrl = Get.put(AuthController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 2),
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 46,
            ),
            SvgPicture.asset(
              "assets/login.svg",
              height: size.height * 0.30,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFielContainer(
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "your_email".tr, border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFielContainer(
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "password".tr, border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                authctrl.login(emailController.text, passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'loggin'.tr,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("no_have_a_account".tr),
                TextButton(
                  onPressed: () => Get.to(SignUpScreen()),
                  child: Text(
                    'sign_up'.tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
