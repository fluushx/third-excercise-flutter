import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:third_project_moves/models/movie.dart';
import 'package:third_project_moves/models/now_playing.dart';
import 'package:third_project_moves/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _urlBase = 'api.themoviedb.org';
  String _apiKey = '4b360cae19decdc41f007738543aab49';
  String _language = 'es-ES';
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print(' MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_urlBase, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    // final Map<String, dynamic> decodeData = convert.jsonDecode(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    // print(onDisplayMovies);
    notifyListeners();
  }

  getPopularMovies() async {
    String _urlBase = 'api.themoviedb.org';
    String _apiKey = '4b360cae19decdc41f007738543aab49';
    String _language = 'es-ES';

    var url = Uri.https(_urlBase, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});
    final response = await http.get(url);
    final nowPopularResponse = PopularResponse.fromJson(response.body);
    popularMovies = nowPopularResponse.results;

    print(nowPopularResponse.results);
    notifyListeners();
  }
}
