import 'package:admin_demo/models/order.dart';
import 'package:admin_demo/models/supplier.dart';
import 'package:admin_demo/services/mongodb_service.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

class OrderController extends GetxController {
  RxList<Order> _orders = <Order>[].obs;

  Future<void> retrieveSupplierOrders(ObjectId id) async {
    await MongoDbservice.createConnection();
    if (!MongoDbservice.db!.isConnected) {
      await MongoDbservice.connect();
    }

    List<Map<String, dynamic>> orders =
        await MongoDbservice.retrieveSupplierOrders(id);

    for (Map<String, dynamic> oreder in orders) {
      _orders.value.add(Order.fromJson(oreder));
    }

    await MongoDbservice.close();
  }

  //getters
  List<Order> get getOrdersList => _orders.value;

  //setters
  setOrdersList(List<Order> v) => _orders.value = v;
}
