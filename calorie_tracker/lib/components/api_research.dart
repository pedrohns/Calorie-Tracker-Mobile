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
      print('ApiResearch - Response Type: ${response.runtimeType}');
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
    print('ApiResearch - handlingFoodsData fired');

    final controllerFood = selectedController('Foods') as FoodList;
    final controllerFoodDetails =
        selectedController('FoodsDetails') as FoodDetailsList;
    data.forEach((dado) {
      controllerFood.addFood(
        Food(
          id: dado['foodRowid'],
          name: dado['name'],
          legend: dado['legend'],
          portion: dado['portion'],
          sizePortion: verifySizePortion(dado['sizePortion']),
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
    });
    // print('ApiResearch - handlingFoodsData - ${controllerFood.foods.first.id}');
  }

  void wipeData() {
    final controllerFood = selectedController('Foods') as FoodList;
    final controllerFoodDetails =
        selectedController('FoodsDetails') as FoodDetailsList;
    controllerFood.cleanFood();
    controllerFoodDetails.cleanFoodDetails();
    print('ApiResearch - WipeData - ${controllerFood.foods.length}');
  }

  double verifySizePortion(dynamic sizePortion) {
    if (sizePortion is int) {
      sizePortion = (sizePortion as int).toDouble();
    } else if (sizePortion is double) {
      sizePortion = sizePortion as double;
    }
    return sizePortion;
  }
}
