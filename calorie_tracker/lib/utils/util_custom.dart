import 'package:calorie_tracker/model/meal.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:calorie_tracker/store/resumed_perfil_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UtilCustom {
  List<Meal> whichMeal(String title, MealList mealList) {
    if (title == 'Café da Manhã') {
      return mealList.breakfastMeals;
    } else if (title == 'Almoço') {
      return mealList.lunchMeals;
    } else if (title == 'Lanche') {
      return mealList.snackMeals;
    } else {
      return mealList.dinnerMeals;
    }
  }
  //Aqui está o problema
  String typeMeal(Meal meal) {
    // print('util_custom typeMeal - ${meals.every((meal) => meal.breakfast)}');
    if(meal.breakfast)
      return 'Café da Manhã';
      else if (meal.lunch)
        return 'Almoço';
      else if (meal.snack)
        return 'Lanche';
    else
      return 'Jantar';
  }

  DateTime getToday() {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    return today;
  }

  bool userIsLogged() => false;

  Future<void> setUserData(String userId) async {
   ResumedPerfilList resumedPerfilList = GetIt.I.get<ResumedPerfilList>();
   resumedPerfilList.addIdUser(resumedPerfilList.todayResumedPerfil, userId);
  }

  void showToast(String msg) {
    Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white54,
          textColor: Colors.red,
          fontSize: 16.0);
  }
}
