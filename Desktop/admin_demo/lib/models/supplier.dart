import 'package:admin_demo/models/location_info.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Supplier {
  ObjectId? id;
  String? name;
  String? description;
  String? email;
  String? phone;
  LocationInfo? locationInfo;

  Supplier({
    this.id,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.locationInfo,
  });

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    email = json['email'];
    phone = json['phone_number'];
    if (json['location_info'] != null) {
      locationInfo = LocationInfo.fromJson(json['location_info']);
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (id != null) {
      data['_id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (description != null) {
      data['description'] = description;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (phone != null) {
      data['phone_number'] = phone;
    }
    if (locationInfo != null) {
      data['location_info'] = locationInfo!.toJson();
    }

    return data;
  }
}
