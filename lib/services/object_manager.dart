import 'package:rick_and_morty_app/dependencies/repository_dependency.dart';
import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:rick_and_morty_app/services/api_manager.dart';

class ObjectManager {
  final ApiManager _apiManager = getIt<ApiManager>();

  Future<RickAndMorty> getObject(String charName) async {
    final int charId = await _apiManager.getCharId(charName);
    final RickAndMorty recievedChar = await _apiManager.getChar(charId);
    return recievedChar;
  }
}
