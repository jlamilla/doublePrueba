import 'dart:convert';

User userFromJson(String str) => User.fromMap(json.decode(str));

String userToJson(User data) => json.encode(data.toMap());

class User {

  User({
    required this.name,
    required this.lastname,
    required this.birthdate,
    required this.email,
  });
  
  String? id;
  String name;
  String lastname;
	String birthdate;
	String email;

  factory User.fromMap(Map<String, dynamic> json) => User(
    name: json['name'],
    lastname: json['lastname'],
    birthdate: json['birthdate'],
    email: json['email'],
  );

  Map<String, dynamic> toMap() => {
    'name':name ,
    'lastname':lastname ,
    'birthdate':birthdate,
    'email':email,
  };
}
