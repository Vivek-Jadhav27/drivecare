import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceRequestRepository {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> addServiceRequest(String garageId, DateTime date, String timeSlot, double amount) async {
    try {
      // Get current user
      User? user = auth.currentUser;
      if (user != null) {
        // Retrieve user details from Firestore
        DocumentSnapshot userSnapshot = await db.collection('users').doc(user.uid).get();
        if (userSnapshot.exists) {
          // Get user's name and vehicle number
          String userName = userSnapshot['username'];
          String phone = userSnapshot['phone'];

          // Construct service request data
          Map<String, dynamic> requestData = {
            'userId': user.uid,
            'userName': userName,
            'phone': phone,
            'garageId': garageId,
            'date': date,
            'timeSlot': timeSlot,
            'amount': amount,
            'status': 'pending', // Assuming initial status is pending
            'createdAt': Timestamp.now(),
          };

          // Add service request to 'serviceRequests' collection
          await db.collection('serviceRequests').add(requestData);
          
          // Add service request to garage's collection
          await db.collection('garages').doc(garageId).collection('serviceRequests').add(requestData);
        } else {
          throw 'User details not found';
        }
      } else {
        throw 'No user is signed in';
      }
    } catch (e) {
      print('Error adding service request: $e');
      throw e;
    }
  }
}
