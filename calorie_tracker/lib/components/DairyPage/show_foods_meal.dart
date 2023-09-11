import 'package:calorie_tracker/model/meal.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ShowFoodsMeal extends StatelessWidget {
  final String title;
  const ShowFoodsMeal({required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodList foods = Provider.of<FoodList>(context, listen: false);
    FoodDetailsList foodsDetails =
        Provider.of<FoodDetailsList>(context, listen: false);
    MealList mealList = Provider.of<MealList>(context, listen: true);

    List<Meal> whichMeal(String title) {
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

    return Observer(builder: (_) {
      final currentMeals = whichMeal(title);
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
