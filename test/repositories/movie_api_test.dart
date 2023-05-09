import 'package:json_practice_flutter/repositories/movie_api.dart';

void main() async {
  MovieApi movieApi = MovieApi();

  final data = await movieApi.getMovieData();
}
