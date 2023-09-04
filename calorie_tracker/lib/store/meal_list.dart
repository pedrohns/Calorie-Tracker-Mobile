import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/meal.dart';

part 'meal_list.g.dart';

class MealList = _MealList with _$MealList;

abstract class _MealList with Store {
  @observable
  ObservableList<Meal> _meals = ObservableList<Meal>();

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
    // print(_meals.length);
  }

  @action
  void cleanMeal() {
    _meals.clear();
  }
}
