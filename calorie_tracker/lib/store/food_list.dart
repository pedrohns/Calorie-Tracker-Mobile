import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/food.dart';

part 'food_list.g.dart';

class FoodList = _FoodList with _$FoodList;

abstract class _FoodList with Store {
  @observable
  ObservableList<Food> _foods = ObservableList<Food>();

  @observable
  ObservableList<Food> searchResults = ObservableList<Food>();

  @computed
  List<Food> get foods => _foods.toList();

  Food? getFoodById(String id) {
    return foods.firstWhere((food) => food.id == id,
        orElse: () => Food(id: 'teste', name: 'Travis Scott'));
  }

  @action
  void addFood(Food data) {
    _foods.add(data);
    //print(foods.length);
  }

  @action
  void addSearch(Food data) {
    searchResults.add(data);
    //print(foods.length);
  }

  @action
  void cleanFood() {
    searchResults.clear();
  }
}
