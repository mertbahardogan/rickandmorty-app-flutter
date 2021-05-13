import 'dart:async';
import 'dart:convert';

import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const baseUrl = "https://rickandmortyapi.com/";
  final http.Client httpClient = http.Client();

  Future<int> getCharId(String charName) async {
    try {
      final searchUrl = Uri.parse(baseUrl + "api/character/?name=" + charName);
      final response = await httpClient
          .get(searchUrl)
          .timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException("Time out. Please try again.");
      });
      if (response.statusCode != 200) {
        throw Exception("Data could not fetched.");
      }
      final responseJson = jsonDecode(response.body);
      return responseJson["results"][0]["id"];
    } on Exception catch (_) {
      throw Exception("Exception occurred.");
    }
  }

  Future<RickAndMorty> getChar(int charId) async {
    try {
      final charUrl = Uri.parse(baseUrl + "api/character/" + charId.toString());
      final response = await httpClient
          .get(charUrl)
          .timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException("Time out. Please try again.");
      });
      if (response.statusCode != 200) {
        throw Exception("Data could not fetched.");
      }
      final responseJson = jsonDecode(response.body);
      return RickAndMorty.fromJson(responseJson);
    } on Exception catch (_) {
      throw Exception("Exception occurred.");
    }
  }
}
