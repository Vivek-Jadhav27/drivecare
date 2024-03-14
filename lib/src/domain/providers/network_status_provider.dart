import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkStatusService {
  final _controller = StreamController<ConnectivityResult>.broadcast();

  Stream<ConnectivityResult> get onNetworkStatusChanged => _controller.stream;

  NetworkStatusService() {
    checkNetworkStatus();
    Timer.periodic(const Duration(minutes: 5), (Timer timer) {
      checkNetworkStatus();
    });
  }

  void checkNetworkStatus() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    _controller.add(result);
  }

  void dispose() {
    _controller.close();
  }
}
