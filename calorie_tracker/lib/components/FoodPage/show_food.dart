import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../model/meal.dart';
import 'package:calorie_tracker/utils/generate_rowid.dart';

class ShowFood extends StatelessWidget {
  const ShowFood({Key? key}) : super(key: key);

  Widget buildSubtitle(List<Food> food, int idx, List<FoodDetails> foodDetail) {
    // print('ShowFood - buildSubtitle - ${food[idx].runtimeType}');
    final data = food[idx];
    return Text(
        '${foodDetail[idx].quantityCal} cal, ${data.sizePortion} ${data.legend}');
  }

  void addingMeal(MealList meals, String foodID, ManageState states) {
    bool isBreakfast = false;
    bool isLunch = false;
    bool isSnack = false;
    bool isDinner = false;
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    if (states.mealTitle == 'Café da Manhã') {
      isBreakfast = true;
    } else if (states.mealTitle == 'Almoço') {
      isLunch = true;
    } else if (states.mealTitle == 'Lanche') {
      isSnack = true;
    } else {
      isDinner = true;
    }
    //  meals.cleanMeal();
    meals.addMeal(Meal(
      id: GenerateRowid().generate(),
      breakfast: isBreakfast,
      lunch: isLunch,
      snack: isSnack,
      dinner: isDinner,
      foodId: foodID,
      day: today,
    ));
  }


  // void addingCalorie(MealList meals, List<Meal> mealsList, List<Meal> currentMeals, FoodDetailsList foodsDetails){
  //   mealsList.forEach((meal) {
  //     if (currentMeals.contains(meal)){
  //       FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
  //       meals.totalConsumed(mealsList, foodsDetails);
  //     // meals.consumedCalorie = meals.consumedCalorie + auxDetail.quantityCal;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    List<Food> foods =
        Provider.of<FoodList>(context, listen: false).searchResults;
    List<FoodDetails> foodsDetails =
        Provider.of<FoodDetailsList>(context, listen: false).searchResults;
    MealList meals = Provider.of<MealList>(context, listen: false);
    ManageState states = Provider.of<ManageState>(context, listen: false);

    return AnimationLimiter(
      child: ListView.builder(
          itemCount: foods.length,
          itemBuilder: (ctx, idx) {
            return AnimationConfiguration.staggeredList(
              position: idx,
              duration: const Duration(milliseconds: 650),
              child: SlideAnimation(
                verticalOffset: 150.0,
                child: FadeInAnimation(
                  child: Card(
                    // color: Color.fromARGB(255, 29, 28, 28),
                    elevation: 5,
                    color: Theme.of(context).colorScheme.secondary,
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        foods[idx].name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      subtitle: buildSubtitle(foods, idx, foodsDetails),
                      trailing: IconButton(
                        onPressed: () {
                          print('ShowFood - Clique do onPressed');
                          addingMeal(meals, foods[idx].id, states);
                          // addingCalorie(meals);
                        },
                        // color: Theme.of(context).colorScheme.secondary,
                        color: Colors.white,
                        icon: Icon(Icons.add),
                      ),
                      onTap: () {
                        print('ShowFood - Clique do onTap');
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
