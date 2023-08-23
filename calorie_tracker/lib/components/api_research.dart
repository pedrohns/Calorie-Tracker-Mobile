import 'package:calorie_tracker/network/http.dart';

class ApiResearch {
  final String? controller;
  ApiResearch({
    this.controller,
  });

  var http = Http();

  Future<void> getFoodData(String search) async {
    var response = await http.createConnection('sendListFoodFatSecret?search=$search');
    if (response.food == 'Não achou nada'){
      response = await http.createConnection('getFoodAPI?search=$search');
    }
  }
}
