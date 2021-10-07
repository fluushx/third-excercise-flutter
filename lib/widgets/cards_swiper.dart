import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:third_project_moves/models/movie.dart';

class CardsSwiper extends StatelessWidget {
  final List<Movie> movies;

  const CardsSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
          width: double.infinity,
          height: size.height * 0.5,
          child: Center(
            child: CircularProgressIndicator(),
          ));
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      //color: Colors.blue,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.5,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext contex, int index) {
          final movie = movies[index];
          print(movie.fullPosterImg);

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detail', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  fadeInDuration: Duration(milliseconds: 200),
                  fit: BoxFit.cover,
                  image: NetworkImage(movie.fullPosterImg)),
            ),
          );
        },
      ),
    );
  }
}
