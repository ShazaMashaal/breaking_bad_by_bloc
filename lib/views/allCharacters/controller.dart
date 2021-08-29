import 'package:breaking_bad_by_bloc/consts/strings.dart';
import 'package:dio/dio.dart';

import 'models/character.dart';

class CharacterController {
  Dio dio;

  characterWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<Character>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return (response.data.map((char)=> Character.fromJson(char)).toList());
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
