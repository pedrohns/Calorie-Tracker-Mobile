import 'package:dio/dio.dart';

const String baseUrl = "http://10.0.2.2:8080/";
var dio = Dio();

class Http {

  static void configureDio() {
    dio.options.connectTimeout = 1000 * 60 * 1;
    dio.options.headers = {'Content-Type':'application/json'};
  }

  Future<dynamic> createConnection(String url) async {
    try{
      configureDio();
      var response = await dio
          .get('http://10.0.2.2:8080/$url');
           print(response.data);
          return response.data;
    } catch (e){
      //  print(e.toString());
      return e.toString();
    }
  }
}
