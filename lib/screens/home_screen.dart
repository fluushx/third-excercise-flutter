import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_project_moves/models/movie.dart';
import 'package:third_project_moves/providers/movie_provider.dart';
import 'package:third_project_moves/widgets/cards_swiper.dart';
import 'package:third_project_moves/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context);
    print(movieProvider.onDisplayMovies);
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search_off_outlined),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //listado cardSwiper
              //tarjetas principales
              CardsSwiper(movies: movieProvider.onDisplayMovies),
              //slider peliculas
              MovieSlider(
                  movies: movieProvider.popularMovies, title: "Populares"),
            ],
          ),
        ));
  }
}
