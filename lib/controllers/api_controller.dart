import 'dart:io';

import 'package:get/get.dart';
import 'package:rick_and_morty_app/dependencies/repository_dependency.dart';
import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:rick_and_morty_app/services/object_manager.dart';

class ApiController extends GetxController {
  var _apiModels = RickAndMorty().obs;

  get apiModels => this._apiModels;
  set apiModels(value) => this._apiModels = value;

  final ObjectManager _objectManager = getIt<ObjectManager>();

  void callGetMethod(String charName) async {
    var result = await _objectManager.getObject(charName);
    try {
      if (result != null) {
        apiModels.value = result;
        print("DEBUG! Operation is okay: " + apiModels.value.name);
      }
    } on Exception catch (_) {
      throw Exception("Invalid data type.");
    }
  }
}
