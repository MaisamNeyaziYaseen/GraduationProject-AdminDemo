import 'package:get/get.dart';

class Message extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": {
          "sign in": "sign in",
          "Sign In": "Sign In",
          "username": "username",
          "password": "password",
        },
        "ar": {
          "sign in": "تسجيل الدخول",
          "Sign In": "تسجيل الدخول",
          "username": "اسم المستخدم",
          "password": "كلمة السر",
        }
      };
}
