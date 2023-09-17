import 'package:admin_demo/models/location_info.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Order {
  ObjectId? id;
  DateTime? date;
  DateTime? deliveryDate;
  String? paymentState;
  String? deliveryState;
  List<Map<String, dynamic>>? items = [];
  Map<String, dynamic>? user;
  LocationInfo? locationInfo;
  double? totalCost;

  //TODO: reconstruct Order class
  Order.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    date = json['date'];
    deliveryDate = json['delivery_date'];
    paymentState = json['payment_state'];
    deliveryState = json['delivery_state'];
    if (json['items'] != null) {
      json['items'].forEach((e) => items!.add(e));
    }
    user = json['user'];
    locationInfo = LocationInfo.fromJson(json['location_information']);
    totalCost = json['total_cost'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (id != null) {
      data['_id'] = id;
    }
    if (date != null) {
      data['date'] = date;
    }
    if (deliveryDate != null) {
      data['delivery_date'] = deliveryDate;
    }
    if (paymentState != null) {
      data['payment_state'] = paymentState;
    }
    if (deliveryState != null) {
      data['delivery_state'] = deliveryState;
    }
    if (items != null) {
      data['items'] = items;
    }
    if (user != null) {
      data['user'] = user;
    }
    if (locationInfo != null) {
      data['location_information'] = locationInfo!.toJson();
    }
    if (totalCost != null) {
      data['total_cost'] = totalCost;
    }
    return data;
  }
}
