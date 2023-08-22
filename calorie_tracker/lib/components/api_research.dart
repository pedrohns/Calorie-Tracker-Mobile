import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:calorie_tracker/network/http.dart';
import 'package:dio/dio.dart';

class ApiResearch {
  final String? controller;
  ApiResearch({
    this.controller,
  });

  Future<void> getFoodData(String search) async {
    // final String foodUrl = 'sendListFoodFatSecret?search=$search';
    // // Primeiro print
    // print('Primeiro print');
    // final client = http.Client();
    // final url = Http.url(foodUrl);
    // final response = await client.get(Uri.parse(url));
    // print('veio aqui');

    var dio = Dio();
    dio.options.connectTimeout = 1000 * 60 * 3;
    try {
      // var response = await dio
      //     .get('http://10.0.2.2:8080/sendListFoodFatSecret?search=$search');
      var response = await dio.get('http://10.0.2.2:8080/getTeste');
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
