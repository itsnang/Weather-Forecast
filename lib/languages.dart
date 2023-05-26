import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'loggin': 'loggin',
          'your_email': 'Your Email',
          'password': 'Password',
          'no_have_a_account': 'Don\'t have a Account?',
          'sign_up': 'Sign Up',
          'title': 'Home Page',
          'sign_out': 'Sign Out'
        },
        'km': {
          'loggin': 'ចូល',
          'your_email': 'អុីម៉ែលរបស់អ្នក',
          'password': 'លេខសម្ងាត់',
          'no_have_a_account': 'មិនទាន់មានគណនី?',
          'sign_up': ' ចុះឈ្មោះ',
          'title': 'ទំព័រដើម',
          'sign_out': 'ចាកចេញ'
        }
      };
}
