import 'package:calorie_tracker/model/food_details.dart';
import 'package:calorie_tracker/model/resumed_perfil.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:get_it/get_it.dart';
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

  @computed
  ResumedPerfil get todayResumedPerfil {
    return _resumedPerfil.firstWhere(
        (perfil) => isSameDay(perfil.day, utils.getToday()),
        orElse: () => ResumedPerfil(day: utils.getToday(), id: 'Erro Dummy'));
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @action
  void totalConsumed([DateTime? dayPassed]) {
    // dayPassed ??= DateTime(1990, 1, 1);
    // if (dayPassed == DateTime(1900, 1, 1)) {
    //   dayPassed = utils.getToday();
    // }
    // ResumedPerfil perfil =
    //     _resumedPerfil.firstWhere((perfil) => isSameDay(perfil.day, dayPassed!));
    ResumedPerfil todayPerfil = todayResumedPerfil;
    List<Meal> meals = GetIt.I.get<MealList>().meals;
    String typeMeal = utils.typeMeal(meals);
    FoodDetailsList foodsDetails = GetIt.I.get<FoodDetailsList>();

    meals.forEach((meal) {
      FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
      if (typeMeal == 'Café da Manhã') {
        todayPerfil.calorieBreakfast =
            todayPerfil.calorieBreakfast + auxDetail.quantityCal;
      } else if (typeMeal == 'Almoço') {
        todayPerfil.calorieLunch =
            todayPerfil.calorieLunch + auxDetail.quantityCal;
      } else if (typeMeal == 'Lanche') {
        todayPerfil.calorieSnack =
            todayPerfil.calorieSnack + auxDetail.quantityCal;
      } else {
        todayPerfil.calorieDinner =
            todayPerfil.calorieDinner + auxDetail.quantityCal;
      }
    });
    _resumedPerfil.removeWhere((toRemove) => toRemove.id == todayPerfil.id);
    _resumedPerfil.add(todayPerfil);
    consumedCalorie = todayPerfil.calorieBreakfast +
        todayPerfil.calorieDinner +
        todayPerfil.calorieLunch +
        todayPerfil.calorieSnack;
  }

  @action
  void addResumedPerfil(ResumedPerfil perfil) {
    print('ResumedPerfilList - addResumedPerfil fired');
    _resumedPerfil.add(perfil);
    // print(_resumedPerfil.first.day);
  }

  @action
  void teste() {
    print('ResumedPerfilList - fired');
  }

  @action
  void addIdUser(ResumedPerfil perfil, String idUser) {
    // Para retornar um perfil
    // ResumedPerfil currentPerfil = _resumedPerfil.firstWhere((searchPerfil) => searchPerfil.id == perfil.id);

    int index = _resumedPerfil.indexWhere((searchPerfil) => searchPerfil.id == perfil.id);
    if(index != -1){
      _resumedPerfil[index].userId = idUser;
    }

  }
}
