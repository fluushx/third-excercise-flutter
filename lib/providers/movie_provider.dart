import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:third_project_moves/models/now_playing.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print(' MoviesProvider inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    String _urlBase = 'api.themoviedb.org';
    String _apiKey = '4b360cae19decdc41f007738543aab49';
    String _language = 'es-ES';

    var url = Uri.https(_urlBase, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    // final Map<String, dynamic> decodeData = convert.jsonDecode(response.body);
    print(nowPlayingResponse.results[0].title);
  }
}
