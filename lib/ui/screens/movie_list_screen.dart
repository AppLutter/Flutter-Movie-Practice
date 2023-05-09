import 'package:flutter/material.dart';
import 'package:json_practice_flutter/repositories/movie_api.dart';

import '../../models/movie_model/movie_model.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  bool? isLoading = true;
  List<MovieModel> movieModels = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        MovieApi movieApi = MovieApi();
        movieModels = await movieApi.getMovieData();
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if(isLoading == null){
      return Center(child: Text('오류 발생'),);
    }

    if (isLoading == true) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      itemCount: movieModels.length,
      itemBuilder: (context, index) {
        final movieModel = movieModels[index];
        return Text(movieModel.movieNm);
      },
    );
  }
}
