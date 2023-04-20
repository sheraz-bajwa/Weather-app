import 'package:flutter/material.dart';
import 'package:weather/Home1.dart';
import 'package:weather/cities/karachi.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
