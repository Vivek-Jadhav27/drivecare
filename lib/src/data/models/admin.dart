import 'dart:convert';


class Admin {
  String id;
  String username;
  String password;

  Admin({
    required this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'password': password,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      id: map['id'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) =>
      Admin.fromMap(json.decode(source) as Map<String, dynamic>);
}