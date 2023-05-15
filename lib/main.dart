import 'package:flutter/material.dart';
//mport 'package:get/get.dart';
//import 'app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';
import 'movie_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Movie Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Movie> futureMovie;

  @override
  void initState() {
    super.initState();
    futureMovie = fetchMovie();
  }

  Future<Movie> fetchMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.example.com/movies')); // Replace with actual API endpoint
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<Movie>(
          future: futureMovie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MovieList(movies: snapshot.data!.results);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
// By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
