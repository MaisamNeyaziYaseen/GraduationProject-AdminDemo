import 'package:admin_demo/controller/order_controller.dart';
import 'package:admin_demo/controller/product_controller.dart';
import 'package:admin_demo/controller/supplier_controller.dart';
import 'package:admin_demo/controller/ui_controller.dart';
import 'package:get/get.dart';
import 'package:admin_demo/controller/admin_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UiController(), tag: "ui_controller", permanent: true);
    Get.put(AdminController(), tag: "admin_controller", permanent: true);
    Get.put(ProductController(), tag: "product_controller", permanent: true);
    Get.put(OrderController(), tag: "order_controller", permanent: true);
    Get.put(SupplierController(), tag: "supplier_controller", permanent: true);
  }
}
