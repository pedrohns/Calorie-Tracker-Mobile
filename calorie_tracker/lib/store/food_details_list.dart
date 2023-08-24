import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/food_details.dart';

part 'food_details_list.g.dart';

class FoodDetailsList = _FoodDetailsList with _$FoodDetailsList;

abstract class _FoodDetailsList with Store {
  @observable
  ObservableList<FoodDetails> _foodDetails = ObservableList<FoodDetails>();

  @computed
  List<FoodDetails> get foodsDetails => _foodDetails.toList();

  @action
  void addFoodDetails(FoodDetails data) {
    _foodDetails.add(data);
    //print(foods.length);
  }

   @action
  void cleanFoodDetails(){
    _foodDetails.clear();
  }
}