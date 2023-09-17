import 'package:admin_demo/models/product.dart';
import 'package:admin_demo/models/supplier.dart';
import 'package:admin_demo/services/mongodb_service.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ProductController extends GetxController {
  RxList<Product> _products = <Product>[].obs;

  Future<void> retrieveSupplierProducts(ObjectId id) async {
    await MongoDbservice.createConnection();
    if (!MongoDbservice.db!.isConnected) {
      await MongoDbservice.connect();
    }

    List<Map<String, dynamic>> products =
        await MongoDbservice.retrieveSupplierProducts(id);

    for (Map<String, dynamic> product in products) {
      _products.value.add(Product.fromJson(product));
    }

    MongoDbservice.close();
  }

  //getters
  List<Product> get getProductsList => _products.value;

  //setters
  setProductsList(List<Product> v) => _products.value = v;
}
