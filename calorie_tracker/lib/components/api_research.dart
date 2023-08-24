import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/network/http.dart';
import 'package:calorie_tracker/model/food.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/food_list.dart';

class ApiResearch {
  final dynamic controller;
  ApiResearch({
    this.controller,
  });
  var http = Http();

  Future<bool> getFoodData(String search) async {
    var response;
    try {
      response =
          await http.createConnection('sendListFoodFatSecret?search=$search');
      print('ApiResearch - Tamanho do array - ${response.length}');
      if (response == 'Não achou nada') {
        print('ApiResearch - Não achou');
        response = await http.createConnection('getFoodAPI?search=$search');
      }
    } catch (e) {
      print('ApiResearch - erro - ${e.toString()}');
    } finally {
      if (response.runtimeType != String) {
        wipeData();
        handlingFoodsData(response);
        return true;
      } else {
        return false;
      }
    }
  }

  dynamic selectedController(String type) => controller[type];

  void handlingFoodsData(List<dynamic> data) {
    final controllerFood = selectedController('Foods') as FoodList;
    final controllerFoodDetails = selectedController('FoodsDetails') as FoodDetailsList;
    data.forEach((dado) {
      controllerFood.addFood(
        Food(
          id: dado['foodRowid'],
          name: dado['name'],
          legend: dado['legend'],
          portion: dado['portion'],
          sizePortion: dado['sizePortion'],
        ),
      );
      controllerFoodDetails.addFoodDetails(
        FoodDetails(
            quantityCal: dado['quantity_cal'],
            carb: dado['carb'],
            fat: dado['fat'],
            protein: dado['protein'],
            id: dado['detailRowid'],
            foodId: dado['foodRowid']),
      );
      // print('HandlingFoodsData - ${dado['foodRowid']}');
    });
  }
  void wipeData(){
    final controllerFood = selectedController('Foods') as FoodList;
    final controllerFoodDetails = selectedController('FoodsDetails') as FoodDetailsList;
    controllerFood.cleanFood();
    controllerFoodDetails.cleanFoodDetails();
  }
}
