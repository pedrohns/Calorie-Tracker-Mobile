import 'package:flutter/material.dart';
import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:get_it/get_it.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:calorie_tracker/utils/util_custom.dart';

class ShowFoodsMeal extends StatelessWidget {
  final String title;
  ShowFoodsMeal({required this.title, Key? key}) : super(key: key);

  UtilCustom utils = UtilCustom();

  @override
  Widget build(BuildContext context) {
    FoodList foods = GetIt.I.get<FoodList>();
    FoodDetailsList foodsDetails =
        GetIt.I.get<FoodDetailsList>();
    MealList mealList = GetIt.I.get<MealList>();

    return Observer(builder: (_) {
      final currentMeals = utils.whichMeal(title, mealList);
      // print('ShowFoodsMeal state: ' + mealList.currentMealTitle);
      return Column(
        children: mealList.meals.map((meal) {
          Food auxFood = foods.getFoodById(meal.foodId)!;
          FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
          if (currentMeals.contains(meal)) {
            return ListTile(
              title: Text(
                auxFood.name,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              trailing: Text(
                '${auxDetail.quantityCal} Kcal',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          } else {
            return Container();
          }
        }).toList(),
      );
    });
  }
}
