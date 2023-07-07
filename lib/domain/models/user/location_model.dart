import 'dart:convert';

Location locationFromJson(String str) => Location.fromMap(json.decode(str));

String locationToJson(Location data) => json.encode(data.toMap());

class Location {

  Location({
    required this.department,
    required this.city,
    required this.address,
  });
  
  String? id;
  String department;
	String city;
	String address;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
    department: json['department'],
    city: json['city'],
    address: json['address'],
  );

  Map<String, dynamic> toMap() => {
    'department':department ,
    'city':city,
    'address':address,
  };
}
