import 'dart:convert';

class User {
  String id;
  String name;
  String email;
  String phone;
  DateTime dob;
  String gender;
  List<DateTime> loginHistory;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
    required this.loginHistory,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob.toString(),
      'gender': gender,
      'loginHistory': loginHistory.map((e) => e.toString()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      dob: DateTime.parse(map['dob'] as String),
      gender: map['gender'] as String,
      loginHistory: List<String>.from(map['loginHistory'] as List<dynamic>)
          .map(
            (e) => DateTime.parse(e),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
