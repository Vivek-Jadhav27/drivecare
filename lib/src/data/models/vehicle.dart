import 'dart:convert';

class Vehicle {
  String id;
  String make;
  String model;
  int year;
  String licensePlate;
  String vin;
  int mileage;
  DateTime lastServiceDate;

  Vehicle({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.licensePlate,
    required this.vin,
    required this.mileage,
    required this.lastServiceDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'make': make,
      'model': model,
      'year': year,
      'licensePlate': licensePlate,
      'vin': vin,
      'mileage': mileage,
      'lastServiceDate': lastServiceDate.toString(),
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'] as String,
      make: map['make'] as String,
      model: map['model'] as String,
      year: map['year'] as int,
      licensePlate: map['licensePlate'] as String,
      vin: map['vin'] as String,
      mileage: map['mileage'] as int,
      lastServiceDate: DateTime.parse(map['lastServiceDate'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source) as Map<String, dynamic>);
}