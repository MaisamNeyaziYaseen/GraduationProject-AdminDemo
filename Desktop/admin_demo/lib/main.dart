import 'dart:io';
import 'package:admin_demo/bindings/global_bindings.dart';
import 'package:admin_demo/view/main_screens/dashboard.dart';
import 'package:admin_demo/view/main_screens/sign_in.dart';
import 'package:firedart/auth/firebase_auth.dart';
import 'package:firedart/auth/token_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_size/window_size.dart';
import 'locals/message.dart';

void main() async {
  runApp(const MainApp());

  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    setWindowMinSize(Size(1250, 600));
  }

  FirebaseAuth.initialize(
      "AIzaSyAOhc_NVpsU1HSVFhhAJbm3L1mnCbC66ro", VolatileStore());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Message(),
      locale: Get.deviceLocale,
      initialRoute: "/SignIn",
      getPages: [
        GetPage(
            name: "/SignIn", page: () => SignIn(), binding: GlobalBindings()),
        GetPage(
            name: "/Dashboard",
            page: () => Dashboard(email: ""),
            binding: GlobalBindings())
      ],
    );
  }
}
