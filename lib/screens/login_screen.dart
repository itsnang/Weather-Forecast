import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/constants.dart';
import 'package:to_do_list/screens/sign_up_screen.dart';
import 'package:get/get.dart';

import '../components/text_fiel_container.dart';
import '../controllers/authController.dart';

class LoginScreen extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 2),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 72,
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
                  decoration: const InputDecoration(
                      hintText: "Your Email", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFielContainer(
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have a Account?"),
                  TextButton(
                    onPressed: () => Get.to(SignUpScreen()),
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
