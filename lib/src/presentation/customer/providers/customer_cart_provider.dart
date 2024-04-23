import 'package:drivecare/src/data/models/service.dart';
import 'package:drivecare/src/domain/repository/service_request_repository.dart';
import 'package:flutter/material.dart';

class CustomerCartProvider extends ChangeNotifier {
  void submitRequest(Service service, DateTime dateTime, String s) async{
    String garageId = service.garageId;
    double amount = service.price;
    await ServiceRequestRepository.addServiceRequest(garageId, dateTime, s, amount);
  }
   
}