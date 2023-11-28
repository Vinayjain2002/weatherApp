
import 'package:flutter/material.dart';
import 'package:weatherapp/pages/loading.dart';
// import 'package:weatherapp/pages/location.dart';
import './pages/Main.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Main(weatherFetchedData: [],),
    },
  ));
}

