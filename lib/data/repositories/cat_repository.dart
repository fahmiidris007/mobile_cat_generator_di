import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_cat_generator_di/domain/models/cat_image.dart';

class CatRepository {
  final http.Client _client;

  CatRepository(this._client);

  Future<CatImage> getCatImage() async {
    final response = await _client
        .get(Uri.parse('https://api.thecatapi.com/v1/images/search'));
    return CatImage.fromJson(jsonDecode(response.body)[0]);
  }
}
