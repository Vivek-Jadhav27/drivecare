import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  String id;
  String serviceName;
  String description;
  String imageURL;
  String garageId;
  double price;

  Service({
    required this.id,
    required this.serviceName,
    required this.price, 
    required this.description, 
    required this.imageURL,
    required this.garageId
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'serviceName': serviceName,
      'price': price,
      'description': description,
      'imageURL': imageURL,
      'garageId': garageId
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] as String,
      serviceName: map['serviceName'] as String,
      price: map['price'] as double, 
      description: map['description'] as String,
      imageURL: map['imageURL'] as String,
      garageId: map['garageId'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Service.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Service(
      id: doc.id,
      serviceName: data['serviceName'] as String,
      price: (data['price'] as num).toDouble(),
      description: data['description'] as String,
      imageURL: data['imageURL'] as String,
      garageId: data['garageId'] as String
    );
  }
}
