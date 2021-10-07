import 'package:flutter/material.dart';
import 'package:third_project_moves/models/movie.dart';
import 'package:third_project_moves/widgets/widgets.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSlider({Key? key, required this.movies, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.title != null) SizedBox(height: 10),
          Padding(
              child: Text(
                'Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20)),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) => _MoviePoster(
                      movies[index],
                      movie: movies[index],
                    )),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster(Movie movi, {Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'detail',
                  arguments: 'movie-instace'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.fullPosterImg),
                    width: 130,
                    height: 160,
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 15),
            Text(movie.title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1)
          ],
        ));
  }
}
