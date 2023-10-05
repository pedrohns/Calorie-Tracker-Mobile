import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/model/resumed_perfil.dart';
import 'package:mobx/mobx.dart';
import 'package:calorie_tracker/model/meal.dart';
import 'food_details_list.dart';
import 'package:calorie_tracker/utils/util_custom.dart';

part 'resumed_perfil_list.g.dart';

class ResumedPerfilList = _ResumedPerfilList with _$ResumedPerfilList;

abstract class _ResumedPerfilList with Store {
  UtilCustom utils = UtilCustom();

  @observable
  ObservableList<ResumedPerfil> _resumedPerfil =
      ObservableList<ResumedPerfil>();

  @computed
  List<ResumedPerfil> get perfil => _resumedPerfil.toList();

  @observable
  int consumedCalorie = 0;

  @action
  void totalConsumed(List<Meal> meals, FoodDetailsList foodsDetails,[DateTime? dayPassed]) {
    dayPassed ??= DateTime(1990, 1, 1);
    if (dayPassed == DateTime(1900, 1, 1)) {
      dayPassed = utils.getToday();
    }
    ResumedPerfil perfil =
        _resumedPerfil.firstWhere((perfil) => perfil.day == dayPassed);
    String typeMeal = utils.typeMeal(meals);
    meals.forEach((meal) {
      FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
      if (typeMeal == 'Café da Manhã') {
        perfil.calorieBreakfast =
            perfil.calorieBreakfast + auxDetail.quantityCal;
      } else if (typeMeal == 'Almoço') {
        perfil.calorieLunch = perfil.calorieLunch + auxDetail.quantityCal;
      } else if (typeMeal == 'Lanche') {
        perfil.calorieSnack = perfil.calorieSnack + auxDetail.quantityCal;
      } else {
        perfil.calorieDinner = perfil.calorieDinner + auxDetail.quantityCal;
      }
    });
    _resumedPerfil.removeWhere((toRemove) => toRemove.id == perfil.id);
    _resumedPerfil.add(perfil);
  }

  @action
  void addResumedPerfil(ResumedPerfil perfil){
    print('ResumedPerfilList - addResumedPerfil fired');
    _resumedPerfil.add(perfil);
    // print(_resumedPerfil.first.day);
  }

  @action
  void teste(){
    print('ResumedPerfilList - fired');
  }
}
