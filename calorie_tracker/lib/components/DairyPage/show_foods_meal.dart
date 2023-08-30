import 'package:calorie_tracker/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';

class ShowFoodsMeal extends StatelessWidget {
  const ShowFoodsMeal({Key? key}) : super(key: key);

  List<Meal> whichMeal(MealList meals, ManageState states) {
    if (states.mealTitle == 'Café da Manhã') {
      return meals.breakfastMeals;
    } else if (states.mealTitle == 'Almoço') {
      return meals.lunchMeals;
    } else if (states.mealTitle == 'Lanche') {
      return meals.snackMeals;
    } else {
      return meals.dinnerMeals;
    }
  }

  @override
  Widget build(BuildContext context) {
    FoodList foods = Provider.of<FoodList>(context, listen: false);
    List<FoodDetails> foodsDetails =
        Provider.of<FoodDetailsList>(context, listen: false).foodsDetails;
    MealList meals = Provider.of<MealList>(context, listen: false);
    ManageState states = Provider.of<ManageState>(context, listen: false);
    List<Meal> realMeal = whichMeal(meals, states);
    return Expanded(
      child: ListView.builder(
        itemCount: realMeal.length,
        itemBuilder: (ctx, idx) {
          Food auxFood = foods.getFoodById(realMeal[idx].foodId)!;
          return ListTile(
            title: Text(auxFood.name),
          );
        },
      ),
    );
  }
}
