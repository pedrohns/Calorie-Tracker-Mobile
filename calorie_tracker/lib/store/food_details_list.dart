import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/food_details.dart';

part 'food_details_list.g.dart';

class FoodDetailsList = _FoodDetailsList with _$FoodDetailsList;

abstract class _FoodDetailsList with Store {
  @observable
  ObservableList<FoodDetails> _foodDetails = ObservableList<FoodDetails>();

  @observable
  ObservableList<FoodDetails> searchResults = ObservableList<FoodDetails>();

  @computed
  List<FoodDetails> get foodsDetails => _foodDetails.toList();

  @action
  void addFoodDetails(FoodDetails data) {
    _foodDetails.add(data);
    //print(foods.length);
  }

  @action
  void cleanFoodDetails() {
    searchResults.clear();
  }

  @action
  void addSearch(FoodDetails data) {
    searchResults.add(data);
    //print(foods.length);
  }

  @action
  FoodDetails getDetailById(String id) {
    return foodsDetails.firstWhere((foodDetail) => foodDetail.foodId == id,
        orElse: () => FoodDetails(
            id: 'teste',
            carb: 1,
            protein: 1,
            fat: 1,
            quantityCal: 1,
            foodId: 'teste'));
  }
}
