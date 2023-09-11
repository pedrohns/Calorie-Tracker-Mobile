import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/model/meal.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TypeMeal extends StatelessWidget {
  final String title;
  final bool hasButton;
  final String secondTitle;
  const TypeMeal({
    Key? key,
    required this.title,
    required this.hasButton,
    required this.secondTitle,
  }) : super(key: key);

  int totalConsumed(List<Meal> meals, FoodDetailsList foodsDetails){
    int consumedCalorie = 0;
    meals.forEach((meal) {
      FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
      consumedCalorie = consumedCalorie + auxDetail.quantityCal;
    });
    return consumedCalorie;
  }

  List<Meal> whichMeal(String title, MealList meals) {
      if (title == 'Café da Manhã') {
        return meals.breakfastMeals;
      } else if (title == 'Almoço') {
        return meals.lunchMeals;
      } else if (title == 'Lanche') {
        return meals.snackMeals;
      } else {
        return meals.dinnerMeals;
      }
    }

  @override
  Widget build(BuildContext context) {
    // double mediaQueryWidth = MediaQuery.of(context).size.width;
    ManageState states = Provider.of<ManageState>(context, listen: false);
    MealList meals = Provider.of<MealList>(context, listen: true);
    FoodDetailsList foodsDetails = Provider.of<FoodDetailsList>(context, listen: false);
    List<Meal> mealSelected = whichMeal(secondTitle, meals);
    double mediaQueryHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    return hasButton == false
        ? Observer(
          builder: (_) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Colors.white38,
                  width: 1,
                )),
              ),
              height: mediaQueryHeight * 0.065,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleSmall!),
                    Text(meals.totalConsumed(mealSelected, foodsDetails).toString()),

                  ],
                ),
              ),
            );
          },
        )
        : Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.white38,
                width: 1,
              )),
            ),
            height: mediaQueryHeight * 0.065,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 4.0, right: 12.0, top: 6.0, bottom: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.food, arguments: secondTitle);
                      states.whichMeal(secondTitle);
                      meals.setCurrentMealTitle(secondTitle);
                    },
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall!,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
