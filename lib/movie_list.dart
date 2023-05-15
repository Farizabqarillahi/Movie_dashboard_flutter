import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class MovieList extends StatefulWidget {
  final List<Result> movies;

  const MovieList({Key? key, required this.movies}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List<Result> filteredMovies;

  @override
  void initState() {
    super.initState();
    filteredMovies = widget.movies;
  }

  void _filterMovies(String query) {
    setState(() {
      filteredMovies = widget.movies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: _filterMovies,
          decoration: InputDecoration(
            hintText: 'Search movies',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredMovies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = filteredMovies[index];
              return MovieCard(movie: movie);
            },
          ),
        ),
      ],
    );
  }
}
