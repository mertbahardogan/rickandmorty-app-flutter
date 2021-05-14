import 'package:get/get.dart';
import 'package:rick_and_morty_app/controllers/network_controller.dart';

class NetworkBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkController());
  }
}
