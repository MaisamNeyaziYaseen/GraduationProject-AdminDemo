import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiController extends GetxController {
  Rx<Locale> _locale = Get.deviceLocale.toString().startsWith("en")
      ? Locale("en").obs
      : Locale("ar").obs;
  RxString _font = Get.deviceLocale.toString().startsWith("en")
      ? RxString("varela_round")
      : RxString("sst_arabic_roman");
  RxString _body = RxString("");
  RxString _productsfilter = RxString("non");
  RxBool _isFetchingData = RxBool(false);
  RxBool _isProcessingSignIn = RxBool(false);

  Locale get getLocale => _locale.value;
  String get getFont => _font.value;
  String get getBody => _body.value;
  String get getProductsFilter => _productsfilter.value;
  bool get getIsFetchingData => _isFetchingData.value;
  bool get getIsProcessingSignIn => _isProcessingSignIn.value;

  setLocale(Locale v) => _locale.value = v;
  setFont(String v) => _font.value = v;
  setBody(String v) => _body.value = v;
  setProductsFilter(String v) => _productsfilter.value = v;
  setIsFetchingData(bool v) => _isFetchingData.value = v;
  setIsProcessingSignIn(bool v) => _isProcessingSignIn.value = v;
}
