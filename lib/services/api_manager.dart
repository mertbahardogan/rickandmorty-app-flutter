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
          .whenComplete(() => print("DEBUG! Data Id fetched!"))
          .timeout(Duration(seconds: 5), onTimeout: () {
        throw TimeoutException("Time out. Please try again.");
      });
      if (response.statusCode != 200) {
        throw Exception("DEBUG! Data could not fetched.");
      }
      final responseJson = jsonDecode(response.body);
      return responseJson["results"][0]["id"];
    } on Exception catch (e) {
      throw Exception("Exception occurred: $e");
    }
  }

  Future<RickAndMorty> getChar(int charId) async {
    try {
      final charUrl = Uri.parse(baseUrl + "api/character/" + charId.toString());
      final response = await httpClient
          .get(charUrl)
          .whenComplete(() => print("DEBUG! Data fetched!"))
          .timeout(Duration(seconds: 5), onTimeout: () {
        throw TimeoutException("Time out. Please try again.");
      });
      if (response.statusCode != 200) {
        throw Exception("Data could not fetched.");
      }
      final responseJson = jsonDecode(response.body);
      return RickAndMorty.fromJson(responseJson);
    } on Exception catch (e) {
      throw Exception("Exception occurred: $e");
    }
  }
}
