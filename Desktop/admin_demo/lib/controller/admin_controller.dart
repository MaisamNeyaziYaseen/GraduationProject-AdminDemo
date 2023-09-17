import 'package:admin_demo/models/admin.dart';
import 'package:admin_demo/services/mongodb_service.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  RxList<Admin> _adminsList = <Admin>[].obs;
  Rx<Admin> _admin = Admin().obs;
  RxBool _emailExist = RxBool(false);

  //CRUD
  //R
  Future<void> retrieveAdminByEmail(String email) async {
    await MongoDbservice.createConnection();
    if (!MongoDbservice.db!.isConnected) {
      await MongoDbservice.connect();
    }
    Map<String, dynamic>? data =
        await MongoDbservice.retrieveAdminByEmail(email);
    if (data != null) {
      setAdmin(Admin.fromJson(data));
    }
    await MongoDbservice.close();
  }

  //R
  Future<void> checkIfEmailExists(String email) async {
    await MongoDbservice.createConnection();
    if (!MongoDbservice.db!.isConnected) {
      await MongoDbservice.connect();
    }
    _emailExist.value =
        await MongoDbservice.checkIfEmailExists(email) == null ? false : true;

    MongoDbservice.close();
  }

  //getters
  Admin get getAdmin => _admin.value;
  bool get getEmailExists => _emailExist.value;
  //setters
  setAdmin(Admin v) => _admin.value = v;
  setEmailExists(bool v) => _emailExist.value = v;
}
