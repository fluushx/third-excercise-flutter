import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_project_moves/models/movie.dart';
import 'package:third_project_moves/providers/movie_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading

    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('Soy el buildResults');
  }

  Widget _empyContainer() {
    return Container(
      child: Center(
          child: Icon(
        Icons.movie_creation_outlined,
        size: 150,
        color: Colors.black38,
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return Container(
        child: Center(
            child: Icon(
          Icons.movie_creation_outlined,
          size: 150,
          color: Colors.black38,
        )),
      );
    }
    final movieProvider = Provider.of<MoviesProvider>(context);
    return FutureBuilder(
      future: movieProvider.searchMovies(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) {
          return _empyContainer();
        }
        final movies = snapshot.data!;
        if (movies.length == 0) {
          return _empyContainer();
        }
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, int index) => _MovieItem(movies[index]));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: AssetImage('assets/no-image.jpg'),
        image: NetworkImage(movie.fullPosterImg),
        width: 50,
        fit: BoxFit.contain,
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: movie);
      },
    );
  }
}
