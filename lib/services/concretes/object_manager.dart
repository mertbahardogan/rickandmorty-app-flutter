import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:rick_and_morty_app/services/abstracts/api_service.dart';
import 'package:rick_and_morty_app/services/abstracts/object_service.dart';

class ObjectManager implements ObjectService {
  ApiService _apiService;

  ObjectManager(ApiService apiService) {
    this._apiService = apiService;
  }

  @override
  Future<Object> getObject(String charName) async {
    final int charId = await _apiService.getCharId(charName);
    final RickAndMorty recievedChar = await _apiService.getChar(charId);
    return recievedChar;
  }
}
