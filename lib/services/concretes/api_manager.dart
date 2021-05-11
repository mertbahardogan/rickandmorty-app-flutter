import 'dart:async';
import 'dart:convert';

import 'package:rick_and_morty_app/models/RickAndMorty.dart';
import 'package:rick_and_morty_app/services/abstracts/api_service.dart';
import 'package:http/http.dart' as http;

class ApiManager implements ApiService {
  static const baseUrl = "https://rickandmortyapi.com/";
  final http.Client httpClient = http.Client();

  @override
  Future<int> getCharId(String charName) async {
    try {
      final searchUrl = Uri.parse(baseUrl + "api/character/?name=" + charName);
      final response = await httpClient
          .get(searchUrl)
          .timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException("Time out. Please try again.");
      });
      if (response.statusCode != 200) {
        throw Exception("Data was not getting.");
      }
      final responseJson = (jsonDecode(response.body)) as List;
      return responseJson[1]["id"];
    } on TimeoutException catch (_) {
      print("Response time out");
    }
    return null;
  }

  @override
  Future<RickAndMorty> getChar(int charId) async {
    try {
      final charUrl = Uri.parse(baseUrl + "api/character/" + charId.toString());
      final response = await httpClient
          .get(charUrl)
          .timeout(Duration(seconds: 20), onTimeout: () {
        throw TimeoutException("Time out. Please try again.");
      });
      if (response.statusCode != 200) {
        throw Exception("Data was not getting.");
      }
      final responseJson = jsonDecode(response.body);
      return RickAndMorty.fromJson(responseJson);
    } on TimeoutException catch (_) {
      print("Response time out");
    }
    return null;
  }
}


