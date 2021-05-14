import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionStatus = 1.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result ;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (_) {
      print("Platform Exception.");
    }
    return _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;
      case ConnectivityResult.none:
        Get.snackbar("Network Error", "Failed to get network connection.");
        connectionStatus.value = 0;
        break;
      default:
        Get.snackbar("Default Work", "This message for testing.");
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}
