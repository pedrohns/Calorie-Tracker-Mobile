import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/meal.dart';

part 'meal_list.g.dart';

class MealList = _MealList with _$MealList;

abstract class _MealList with Store {
  @observable
  ObservableList<Meal> _meals = ObservableList<Meal>();

  @computed
  List<Meal> get meals => _meals.toList();

  @action
  void addMeal(Meal data) {
    _meals.add(data);
    //print(foods.length);
  }

  @action
  void cleanMeal() {
    _meals.clear();
  }
}
