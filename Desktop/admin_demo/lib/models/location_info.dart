class LocationInfo {
  String? country;
  String? region;
  String? county;
  String? street;
  String? building;
  String? apartment;

  LocationInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    region = json['region'];
    county = json['county'];
    street = json['street'];
    building = json['building'];
    apartment = json['apartment'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    if (country != null) {
      data['country'] = country;
    }
    if (region != null) {
      data['region'] = region;
    }
    if (county != null) {
      data['county'] = country;
    }
    if (street != null) {
      data['street'] = street;
    }
    if (building != null) {
      data['building'] = building ?? "";
    }
    if (apartment != null) {
      data['apartment'] = apartment ?? "";
    }

    return data;
  }
}
