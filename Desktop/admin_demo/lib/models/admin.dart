import 'package:admin_demo/models/supplier.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Admin {
  ObjectId? id;
  String? firstName;
  String? lasetName;
  DateTime? birthDate;
  String? gender;
  String? phone;
  String? email;
  Supplier? supplier;

  Admin(
      {this.id,
      this.firstName,
      this.lasetName,
      this.birthDate,
      this.gender,
      this.phone,
      this.email,
      this.supplier});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstName = json['first_name'];
    lasetName = json['last_name'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    phone = json['phone_number'];
    email = json['email'];
    supplier = Supplier.fromJson(json['supplier']);
  }
}
