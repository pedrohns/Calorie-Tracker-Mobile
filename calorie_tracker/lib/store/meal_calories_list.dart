import 'package:calorie_tracker/model/meal_calorie.dart';
import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/meal.dart';
import 'food_details_list.dart';

part 'meal_calories_list.g.dart';

class MealCaloriesList = _MealCaloriesList with _$MealCaloriesList;

abstract class _MealCaloriesList with Store {

  @observable
  ObservableList<MealCalorie> _mealCalories = ObservableList<MealCalorie>();

  @observable
  int consumedCalorie = 0;

  @action
  void totalConsumed(List<Meal> meals, FoodDetailsList foodsDetails){
    // consumedCalorie = 0;
    // meals.forEach((meal) {
    //   FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
    //   consumedCalorie = consumedCalorie + auxDetail.quantityCal;
    // });
    // return consumedCalorie;


  }

}
