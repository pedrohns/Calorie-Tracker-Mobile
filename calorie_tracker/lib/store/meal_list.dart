import 'package:calorie_tracker/model/meal_calorie.dart';
import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/meal.dart';
import 'food_details_list.dart';

part 'meal_list.g.dart';

class MealList = _MealList with _$MealList;

abstract class _MealList with Store {
  @observable
  ObservableList<Meal> _meals = ObservableList<Meal>();

  @observable
  ObservableList<MealCalorie> _mealCalories = ObservableList<MealCalorie>();

  @observable
  String currentMealTitle = '';

  @observable
  int consumedCalorie = 0;

  @computed
  List<Meal> get meals => _meals.toList();

  @computed
  List<Meal> get breakfastMeals =>
      _meals.where((meal) => meal.breakfast).toList();

  @computed
  List<Meal> get lunchMeals => _meals.where((meal) => meal.lunch).toList();

  @computed
  List<Meal> get snackMeals => _meals.where((meal) => meal.snack).toList();

  @computed
  List<Meal> get dinnerMeals => _meals.where((meal) => meal.dinner).toList();

  @action
  void addMeal(Meal data) {
    _meals.add(data);
    // _meals.forEach((meal) {
    //   print('addMeal: ' + meal.foodId);
    //   print('addMeal: ' + meal.breakfast.toString());
    //   print('addMeal: ' + meal.lunch.toString());
    // });
  }

  @action
  void totalConsumed(List<Meal> meals, FoodDetailsList foodsDetails){
    // consumedCalorie = 0;
    // meals.forEach((meal) {
    //   FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
    //   consumedCalorie = consumedCalorie + auxDetail.quantityCal;
    // });
    // return consumedCalorie;


  }

  @action
  void setCurrentMealTitle(String title) {
    currentMealTitle = title;
  }

  @computed
  List<Meal> get currentMeals {
    if (currentMealTitle == 'Café da Manhã') {
      return breakfastMeals;
    } else if (currentMealTitle == 'Almoço') {
      return lunchMeals;
    } else if (currentMealTitle == 'Lanche') {
      return snackMeals;
    } else {
      return dinnerMeals;
    }
  }

  @action
  void cleanMeal() {
    _meals.clear();
  }
}
