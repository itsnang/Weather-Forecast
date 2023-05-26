import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do_list/screens/home_screen.dart';
import 'package:to_do_list/utils/app_controll.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  final _isLogin = false.obs;
  set isLogin(bool value) => _isLogin.value = value;
  bool get isLogin => _isLogin.value;

  RxString title = 'Home Page'.obs;

  @override
  void onInit() {
    onCheckLogin();

    super.onInit();
  }

  Future<void> onCheckLogin() async {
    isLogin = FirebaseAuth.instance.currentUser == null
        ? false
        : true; // implement to save on locall storage
    print("isLogin $isLogin");
  }

  void createUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(' Error creating accouting ', e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password); // save on local storage

      isLogin = true;
      await box.write('isLogin', isLogin);

      // if (FirebaseAuth.instance.currentUser!.uid == null) {
      //   return;
      // } else {
      //   Get.to(HomeScreen());
      // }
    } catch (e) {
      Get.snackbar('Error login', e.toString());
    }
  }

  void singOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      isLogin = false;
      await box.remove('isLogin');
    } catch (e) {
      Get.snackbar('Error sign out', e.toString());
    }
  }

  void changeTitle(String newText) {
    title.value = newText;
  }
}
