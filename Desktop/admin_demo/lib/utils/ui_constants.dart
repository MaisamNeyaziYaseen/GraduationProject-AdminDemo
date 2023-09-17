import 'package:admin_demo/controller/ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiConstants {
  static Color mainColor = Color(0xff5D3891);
  static Color orange = Color(0xffFC9C1B);
  static Color sndColor = Color(0xFFF4F4F4);

  static UiController uiController =
      Get.find<UiController>(tag: "ui_controller");
}
