import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:to_do_list/style_constants.dart';
import 'package:to_do_list/controllers/authController.dart';

import '../components/text_fiel_container.dart';

class SignUpScreen extends GetWidget<AuthController> {
  // final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kPrimaryColor,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 2),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                "assets/signup.svg",
                height: size.height * 0.30,
              ),
              const SizedBox(
                height: 14,
              ),
              // TextFielContainer(
              //   child: TextField(
              //     controller: nameController,
              //     decoration: const InputDecoration(
              //         hintText: "Your Name", border: InputBorder.none),
              //   ),
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
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
                  controller.createUser(
                      // nameController.text,
                      emailController.text,
                      passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'sign_up'.tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
