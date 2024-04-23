import 'package:firebase_auth/firebase_auth.dart';

class ServiceRequest {
  final DateTime date;
  final String timeSlot;
  final String userName;
  final String mobileNumber;
  final double amount;
  final String garageId;  // Assuming each request is tied to a specific garage
  final DateTime createdAt;

  ServiceRequest({
    required this.date,
    required this.timeSlot,
    required this.userName,
    required this.mobileNumber,
    required this.amount,
    required this.garageId,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'timeSlot': timeSlot,
      'userName': userName,
      'mobileNumber': mobileNumber,
      'amount': amount,
      'garageId': garageId,
      'userId': FirebaseAuth.instance.currentUser?.uid, // Include the user ID for reference
      'createdAt': DateTime.now(),
    };
  }
}
