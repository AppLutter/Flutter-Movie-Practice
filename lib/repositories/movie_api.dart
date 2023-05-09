import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_practice_flutter/const.dart';
import 'package:json_practice_flutter/models/movie_model/movie_model.dart';

class MovieApi {
  final baseUrl =
      'http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json';

  Future<List<MovieModel>> getMovieData() async {
    final Uri url = Uri.parse('$baseUrl?key=$movieApiKey&targetDt=20230508');
    final response = await http.get(url);
    final Iterable data = jsonDecode(response.body)['boxOfficeResult']['dailyBoxOfficeList'];
    final movieModels = data.map((e) => MovieModel.fromJson(e)).toList();
    throw(Exception());
    return movieModels;
  }
}
