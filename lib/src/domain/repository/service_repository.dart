import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drivecare/src/data/models/service.dart';
// import 'package:drivecare/src/utils/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

class ServiceRepository {
  static FirebaseFirestore db = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> addService(Map<String, dynamic> serviceData) async {
    try {
      await db.collection('services').add(serviceData);
    } catch (e) {
      print('Error adding service: $e');
      rethrow;
    }
  }

  static Future<void> updateService(
      String serviceId, Map<String, dynamic> newData) async {
    try {
      await db.collection('services').doc(serviceId).update(newData);
    } catch (e) {
      print('Error updating service: $e');
      rethrow;
    }
  }

  static Future<void> deleteService(String serviceId) async {
    try {
      await db.collection('services').doc(serviceId).delete();
    } catch (e) {
      print('Error deleting service: $e');
      rethrow;
    }
  }

  static Future<List<Service>> getAllServices() async {
    try {
      final querySnapshot = await db.collection('services').get();
      return querySnapshot.docs
          .map((doc) => Service.fromFirestore(doc))
          .toList();
    } catch (e) {
      print('Error getting all services: $e');
      rethrow;
    }
  }
}
