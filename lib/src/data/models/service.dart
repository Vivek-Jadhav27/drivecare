import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String id;
  String name;
  double price;

  Service({
    required this.id,
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Service.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Service(
      id: doc.id,
      name: data['name'] as String,
      price: (data['price'] as num).toDouble(),
    );
  }
}
