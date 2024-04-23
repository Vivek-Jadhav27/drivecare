import 'package:drivecare/src/data/models/service.dart';
import 'dart:convert';

class ServiceProvider {
  String id;
  String name;
  String email;
  String phone;
  List<Service> servicesProvided;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.servicesProvided,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'servicesProvided':
          servicesProvided.map((service) => service.toMap()).toList(),
    };
  }

  factory ServiceProvider.fromMap(Map<String, dynamic> map) {
    return ServiceProvider(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      servicesProvided: (map['servicesProvided'] as List<dynamic>)
          .map((service) => Service.fromMap(service as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProvider.fromJson(String source) =>
      ServiceProvider.fromMap(json.decode(source) as Map<String, dynamic>);
}
