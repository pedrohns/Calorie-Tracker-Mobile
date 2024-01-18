import 'dart:io';

import 'package:dio/dio.dart';

const String baseUrl = "http://10.0.2.2:8080/";
Dio _dio = Dio();

class Http {
  static void configureDio() {
    _dio.options.connectTimeout = 1000 * 60 * 1;
    _dio.options.headers = {'Content-Type': 'application/json'};
  }

  Future<dynamic> createConnection(String url) async {
    try {
      configureDio();
      var response = await _dio.get('http://10.0.2.2:8080/$url');
      print('Http - ${response.data["food"].runtimeType}');
      return response.data["food"];
    } catch (e) {
      //  print(e.toString());
      return e.toString();
    }
  }

  Future<dynamic> sendRequest(String url, String type, [Object? obj]) async {
    try {
      configureDio();
      dynamic response;
      if(type == 'get') {
        response = await _dio.get('http://10.0.2.2:8080/$url');
      } else if (type == 'post') {
        response = await _dio.post('http://10.0.2.2:8080/$url', data: obj);
      }
      print('sendRequest response ${response.data}');
      return response.data;
    } catch (e) {
      //  print(e.toString());
      return e.toString();
    }
  }
}
