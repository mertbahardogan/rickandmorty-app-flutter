import 'package:get/get.dart';
import 'package:rick_and_morty_app/locator/repository_locator.dart';
import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:rick_and_morty_app/services/object_manager.dart';

class ApiController extends GetxController {
  var getModels = RickAndMorty().obs;

  final ObjectManager _objectManager = getIt<ObjectManager>();

  callGetMethod(String charName) async {
    var result = await _objectManager.getObject(charName);
    if (result != null) {
      getModels.value = result;
      print("Operation is okay: "+getModels.value.name);
    }
  }
}
