import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/Karachimodel.dart';
import 'package:weather/services/apiurl.dart';

class Weatherservices {
  Future<WWeather> fetchRecords() async {
    final response = await http.get(Uri.parse(AppUrl.Lahore));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);

      return WWeather.fromJson(data1);
    } else {
      throw Exception('Error');
    }
  }

  Future<WWeather> fetchRecords1() async {
    final response = await http.get(Uri.parse(AppUrl.Karachi));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);

      return WWeather.fromJson(data1);
    } else {
      throw Exception('Error');
    }
  }

  Future<WWeather> fetchRecords2() async {
    final response = await http.get(Uri.parse(AppUrl.Delhi));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);

      return WWeather.fromJson(data1);
    } else {
      throw Exception('Error');
    }
  }

  Future<WWeather> fetchRecords3() async {
    final response = await http.get(Uri.parse(AppUrl.London));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);

      return WWeather.fromJson(data1);
    } else {
      throw Exception('Error');
    }
  }

  Future<WWeather> fetchRecords4() async {
    final response = await http.get(Uri.parse(AppUrl.cairo));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);

      return WWeather.fromJson(data1);
    } else {
      throw Exception('Error');
    }
  }

  Future<WWeather> fetchRecords5() async {
    final response = await http.get(Uri.parse(AppUrl.istambol));

    if (response.statusCode == 200) {
      var data1 = jsonDecode(response.body);

      return WWeather.fromJson(data1);
    } else {
      throw Exception('Error');
    }
  }
}
