import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:calorie_tracker/model/resumed_perfil.dart';
import 'package:calorie_tracker/utils/util_custom.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/model/food.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../model/meal.dart';
import 'package:calorie_tracker/utils/generate_rowid.dart';
import 'package:calorie_tracker/store/resumed_perfil_list.dart';

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
    DateTime today = UtilCustom().getToday();
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

  @override
  Widget build(BuildContext context) {
    List<Food> foods =
        GetIt.I.get<FoodList>().searchResults;
    List<FoodDetails> foodsDetails =
        GetIt.I.get<FoodDetailsList>().searchResults;
    MealList meals = GetIt.I.get<MealList>();
    ManageState states = GetIt.I.get<ManageState>();
    ResumedPerfilList perfil = GetIt.I.get<ResumedPerfilList>();

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
                          perfil.totalConsumed();
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
