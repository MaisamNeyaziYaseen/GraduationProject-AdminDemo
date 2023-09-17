import 'package:admin_demo/controller/admin_controller.dart';
import 'package:admin_demo/controller/order_controller.dart';
import 'package:admin_demo/controller/product_controller.dart';
import 'package:admin_demo/controller/supplier_controller.dart';
import 'package:admin_demo/utils/ui_constants.dart';
import 'package:admin_demo/view/components/dashboard_subsection.dart';
import 'package:admin_demo/view/components/home_body.dart';
import 'package:admin_demo/view/components/orders_body.dart';
import 'package:admin_demo/view/components/account_body.dart';
import 'package:admin_demo/view/components/dashboard_section.dart';
import 'package:admin_demo/controller/ui_controller.dart';
import 'package:admin_demo/view/components/products_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  String email;
  Dashboard({super.key, required this.email});

  @override
  State<Dashboard> createState() => _DashboardState(email: email);
}

class _DashboardState extends State<Dashboard> {
  UiController _uiController = UiController();
  AdminController _adminController = Get.find(tag: "admin_controller");
  ProductController _productController = Get.find(tag: "product_controller");
  OrderController _orderController = Get.find(tag: "order_controller");

  String email;

  _DashboardState({required this.email});

  @override
  void initState() {
    super.initState();
    print("in int state");
    _fetchData();
  }

  _fetchData() async {
    _uiController.setIsFetchingData(true);
    await _adminController.retrieveAdminByEmail(email);
    await _productController
        .retrieveSupplierProducts(_adminController.getAdmin.supplier!.id!);
    await _orderController
        .retrieveSupplierOrders(_adminController.getAdmin.supplier!.id!);
    _uiController.setIsFetchingData(false);
  }

  Widget _getBody(String body) {
    switch (body) {
      case "AccountBody":
        return AccountBody();
      case "HomeBody":
        return HomeBody();
      case "ProductsBody":
        return ProductsBody();
      case "OrdersBody":
        return OrdersBody();
      default:
        return HomeBody();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: UiConstants.mainColor,
        ),
        body: Obx(() => Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        children: [
                          DashboardSection(
                              leading: Icons.person_outline,
                              section: "Account",
                              onTap: () {
                                _uiController.setBody("AccountBody");
                              }),
                          DashboardSection(
                              leading: Icons.home_outlined,
                              section: "Home",
                              onTap: () {
                                _uiController.setBody("HomeBody");
                              }),
                          DashboardSection(
                              leading: Icons.folder_outlined,
                              section: "Products",
                              isEnabled: false,
                              onTap: () {}),
                          DashboardSubsection(
                              title: "View Products",
                              onTap: () {
                                _uiController.setBody("ProductsBody");
                              }),
                          DashboardSubsection(
                              title: "Add Product",
                              onTap: () {
                                //go to add product
                              }),
                          DashboardSection(
                              leading: Icons.shopping_bag_outlined,
                              section: "Orders",
                              isEnabled: false,
                              onTap: () {}),
                          DashboardSubsection(
                              title: "View Orders",
                              onTap: () {
                                _uiController.setBody("OrdersBody");
                              }),
                        ],
                      ),
                    ),
                    _getBody(_uiController.getBody),
                  ],
                ),
                _uiController.getIsFetchingData
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.black.withOpacity(0.5),
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
