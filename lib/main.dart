import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'data/top_rated.dart';

void main() => runApp(IOMovies());

class IOMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'IOMovies',
        debugShowCheckedModeBanner: false,
        home: IOMov(),
        theme: ThemeData(
          accentColor: Colors.white,
          primaryColor: Colors.amberAccent,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.white,
            ),
            headline: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
}

class IOMov extends StatefulWidget {
  @override
  _IOMovState createState() => _IOMovState();
}

class _IOMovState extends State<IOMov> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'IO Movies',
            style: TextStyle(
              color: Colors.deepOrange,
            ),
          ),
        ),
      );

  final String baseUrl = "https://api.themoviedb.org/3/";
  final String configUrl = "configuration";
  final String apiKey = "4acf1695d8b127b9fc965a06a79f7e64";
  final String topRatedMovies = "movie/top_rated";

  TopRated topRated;

  void getConfig() async {
    var resTop = await http.get(
        Uri.encodeFull(baseUrl + topRatedMovies + "?api_url=" + apiKey),
        headers: {"Accept": "application/json"});

    setState(() {
      var decodedRes = json.decode(resTop.body);
      topRated = TopRated.fromJson(decodedRes);
    });
  }
}
