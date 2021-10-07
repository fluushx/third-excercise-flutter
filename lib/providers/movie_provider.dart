import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:third_project_moves/models/credits_response.dart';
import 'package:third_project_moves/models/movie.dart';
import 'package:third_project_moves/models/now_playing.dart';
import 'package:third_project_moves/models/popular_response.dart';

class MoviesProvider extends ChangeNotifier {
  String _urlBase = 'api.themoviedb.org';
  String _apiKey = '4b360cae19decdc41f007738543aab49';
  String _language = 'es-ES';
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  int _popularPage = 0;

  Map<int, List<Cast>> movieCast = {};

  MoviesProvider() {
    print(' MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    var url = Uri.https(_urlBase, endPoint,
        {'api_key': _apiKey, 'language': _language, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
    // final Map<String, dynamic> decodeData = convert.jsonDecode(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    // print(onDisplayMovies);
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;
    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final nowPopularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = nowPopularResponse.results;

    print(nowPopularResponse.results);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    //TODO: revisar si hay mapa
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
