import 'package:admin_demo/models/supplier.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDbservice {
  static Db? db;

  //create conection
  static Future<void> createConnection() async {
    print("in create connection");
    db = await Db.create(
        "mongodb+srv://Maisam:Maisam1234@cluster0.4h9ch0h.mongodb.net/GraduationProjectDB/");
  }

  //connect db
  static Future<void> connect() async {
    print("in connect");
    await db!.open();

    if (db!.isConnected) {
      print("connected to db");
    }
  }

  //close connection
  static Future<void> close() async {
    if (db!.isConnected) {
      await db!.close();
      if (!db!.isConnected) {
        print("db closed");
      }
    }
  }

  //Admins collection CRUD
  //R check if email exists
  static Future<Map<String, dynamic>?> checkIfEmailExists(String email) async {
    DbCollection collection = db!.collection('admins');
    return await collection.findOne(where.eq('email', email));
  }

  //R get admin by email
  static Future<Map<String, dynamic>?> retrieveAdminByEmail(
      String email) async {
    DbCollection collection = db!.collection("admins");
    return await collection.findOne(where.eq("email", email));
  }

  //suppliers collection
  static Future<Map<String, dynamic>?> retrieveSupplier(ObjectId id) async {
    DbCollection collection = db!.collection('suppliers');

    return await collection.findOne(where.eq('_id', id));
  }

  //Orders collection
  //R retrieve orders by ids
  static Future<List<Map<String, dynamic>>> retrieveSupplierOrders(
      ObjectId id) async {
    DbCollection collection = db!.collection('orders');

    List<Map<String, dynamic>> allOrders = await collection.find().toList();
    List<Map<String, dynamic>> supplierOrders = [];

    for (Map<String, dynamic> order in allOrders) {
      for (Map<String, dynamic> item in order['items']) {
        print(item['supplier_id']);
        if (item['supplier_id'] == id) {
          print("in add");
          supplierOrders.add(order);
          break;
        }
      }
    }
    return supplierOrders;
  }

  //Products collection
  //R retrieve products by supplier id
  static Future<List<Map<String, dynamic>>> retrieveSupplierProducts(
      ObjectId id) async {
    DbCollection collection = db!.collection('products');

    List<Map<String, dynamic>> allProducts = await collection.find().toList();
    List<Map<String, dynamic>> supplierProducts = [];

    for (Map<String, dynamic> product in allProducts) {
      if (product['supplier']['_id'] == id) {
        supplierProducts.add(product);
      }
    }
    return supplierProducts;
  }
}
