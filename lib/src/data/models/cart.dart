import 'dart:convert';

import 'package:drivecare/src/data/models/service.dart';

class Cart {
  List<Service> services;
  double total;

  Cart({
    required this.services,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'services': services.map((service) => service.toMap()).toList(),
      'total': total,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      services: (map['services'] as List<dynamic>)
          .map((service) => Service.fromMap(service as Map<String, dynamic>))
          .toList(),
      total: map['total'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}