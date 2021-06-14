import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_api_call/models/restapi.dart';
import 'package:http_api_call/widgets/detail.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  // ignore: deprecated_member_use
  List<Movie> _movies = <Movie>[];

  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  //FETCH Data
  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http.get(
        Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('Batman Movies')),
        ),
        body: MoviesDetail(movies: _movies),
      ),
    );
  }
}
