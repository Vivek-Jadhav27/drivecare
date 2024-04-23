import 'package:drivecare/src/data/models/service.dart';
import 'package:drivecare/src/domain/repository/service_repository.dart';
import 'package:flutter/material.dart';

class CustomerSerivceProvider extends ChangeNotifier {
  List<Service> _services = [];

  init() async{
    print('Hello');
    fetchSerivces();
    print(_services.length);
  }
    List<Service> get services => _services;

   Future<void>  fetchSerivces() async {
    List<Service> services = await ServiceRepository.getAllServices();
    print(services.length);
    _services= services;
    notifyListeners();
  }
  

}
