import 'package:admin_demo/models/supplier.dart';
import 'package:admin_demo/services/mongodb_service.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

class SupplierController extends GetxController {
  Rx<Supplier> _supplier = Supplier().obs;

  Future<void> retrieveSupplier(ObjectId id) async {
    await MongoDbservice.createConnection();
    if (!MongoDbservice.db!.isConnected) {
      await MongoDbservice.connect();
    }

    var data = await MongoDbservice.retrieveSupplier(id);
    if (data != null) {
      setSupplier(Supplier.fromJson(data));
    }
    await MongoDbservice.close();
  }

  //getters
  Supplier get getSupplier => _supplier.value;

  //setters
  setSupplier(Supplier v) => _supplier.value = v;
}
