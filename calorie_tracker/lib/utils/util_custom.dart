import 'package:calorie_tracker/model/meal.dart';
import 'package:calorie_tracker/store/meal_list.dart';

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

  String typeMeal(List<Meal> meals) {
    if (meals.every((meal) => meal.breakfast))
      return 'Café da Manhã';
    else if (meals.every((meal) => meal.lunch))
      return 'Almoço';
    else if (meals.every((meal) => meal.snack))
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

  Future<void> setUserData() async {
    
  }
}
