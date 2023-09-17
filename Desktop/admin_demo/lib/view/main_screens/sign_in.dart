import 'package:admin_demo/controller/admin_controller.dart';
import 'package:admin_demo/controller/ui_controller.dart';
import 'package:admin_demo/services/firebase/firebase_auth.dart';
import 'package:admin_demo/utils/ui_constants.dart';
import 'package:admin_demo/view/components/customized_text_field.dart';
import 'package:admin_demo/view/main_screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AdminController _adminController = Get.find(tag: "admin_controller");
  UiController _uiController = Get.find(tag: "ui_controller");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.black,
                        UiConstants.mainColor,
                        Colors.black,
                      ])),
                ),
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: UiConstants.uiController.getFont),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //textfield
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    CustomizedTextField(
                                      textEditingController: _emailController,
                                      hintText: "username".tr,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomizedTextField(
                                      textEditingController:
                                          _passwordController,
                                      hintText: "password".tr,
                                      isObsecure: true,
                                    ),
                                  ],
                                )),

                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  _uiController.setIsProcessingSignIn(true);
                                  //validation
                                  if (_formKey.currentState!.validate()) {
                                    await _adminController.checkIfEmailExists(
                                        _emailController.text);
                                    if (_adminController.getEmailExists) {
                                      await AuthService.signInByEmail(
                                          _emailController.text,
                                          _passwordController.text, (e) {
                                        //exception
                                        _uiController
                                            .setIsProcessingSignIn(false);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                          e.toString(),
                                          style: TextStyle(
                                              fontFamily: UiConstants
                                                  .uiController.getFont),
                                        )));
                                      }, (user) {
                                        if (user != null) {
                                          //user signed in
                                          _uiController
                                              .setIsProcessingSignIn(false);
                                          Get.offAll(() => Dashboard(
                                                email: _emailController.text,
                                              ));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                            "Signed in successfully",
                                            style: TextStyle(
                                                fontFamily: UiConstants
                                                    .uiController.getFont),
                                          )));
                                        }
                                      });
                                    } else {
                                      _uiController
                                          .setIsProcessingSignIn(false);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                        "Email is not exist",
                                        style: TextStyle(
                                            fontFamily: UiConstants
                                                .uiController.getFont),
                                      )));
                                    }
                                  } else {
                                    _uiController.setIsProcessingSignIn(false);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: UiConstants.mainColor,
                                ),
                                child: Text(
                                  "sign in".tr,
                                  style: TextStyle(
                                      fontFamily:
                                          UiConstants.uiController.getFont),
                                )),

                            IconButton(
                                onPressed: () {
                                  if (UiConstants.uiController.getLocale ==
                                      const Locale("en")) {
                                    UiConstants.uiController
                                        .setLocale(const Locale("ar"));
                                    UiConstants.uiController
                                        .setFont("sst_arabic_roman");
                                    Get.updateLocale(
                                        UiConstants.uiController.getLocale);
                                  } else if (UiConstants
                                          .uiController.getLocale ==
                                      const Locale("ar")) {
                                    UiConstants.uiController
                                        .setLocale(const Locale("en"));
                                    UiConstants.uiController
                                        .setFont("varela_round");
                                    Get.updateLocale(
                                        UiConstants.uiController.getLocale);
                                  }
                                  print(UiConstants.uiController.getLocale);
                                },
                                icon: Icon(
                                  Icons.language_outlined,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                _uiController.getIsProcessingSignIn
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Please wait",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            )));
  }
}
