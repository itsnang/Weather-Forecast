import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/controllers/bindings/authBinding.dart';
import 'package:to_do_list/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
