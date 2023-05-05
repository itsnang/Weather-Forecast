import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_list/constants.dart';

import '../components/text_fiel_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              // const Text(
              //   'LOGIN',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              SvgPicture.asset(
                "assets/login.svg",
                height: size.height * 0.30,
              ),
              const SizedBox(
                height: 24,
              ),
              const TextFielContainer(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Your Email", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const TextFielContainer(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password", border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Log in'),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have a Account?"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
