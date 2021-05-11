import 'package:get/get.dart';
import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:rick_and_morty_app/services/abstracts/api_service.dart';
import 'package:rick_and_morty_app/services/abstracts/object_service.dart';
import 'package:rick_and_morty_app/services/concretes/api_manager.dart';

class ApiController extends GetxController {
  var getModels = RickAndMorty().obs;

  //Dependecy Injection
  ObjectService _objectService;

  ApiController(ObjectService objectService) {
    this._objectService = objectService;
  }

  //I guess we must call this method in widgets. We'll send charName get text. 
  //I hope, We will see tomorrow
  //   callGetMethod(String charName);

  // @override
  // void onInit() {
  //   callGetMethod(String charName);
  //   super.onInit();
  // }

  callGetMethod(String charName) async {
    var result = await _objectService.getObject(charName);
    if (result != null) {
      getModels.value = result;
    }
  }
}
