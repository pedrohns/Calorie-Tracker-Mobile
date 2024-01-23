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

  @observable
  bool showMacrosDataChanged = false;

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
    ResumedPerfil todayPerfil = todayResumedPerfil;
    List<Meal> meals = GetIt.I.get<MealList>().meals;
    String typeMeal = utils.typeMeal(meals);
    FoodDetailsList foodsDetails = GetIt.I.get<FoodDetailsList>();
    // faço isso para que quando percorrer o array de alimentos, não somar tudo novamente
    resetCounterCalorie(todayPerfil);

    meals.forEach((meal) {
      FoodDetails auxDetail = foodsDetails.getDetailById(meal.foodId);
      print('ResumedPerfilList totalConsumed - $typeMeal');
      if (typeMeal == 'Café da Manhã') {
        todayPerfil.calorieBreakfast =
            todayPerfil.calorieBreakfast + auxDetail.quantityCal;
        todayPerfil.carbBreakfast = todayPerfil.carbBreakfast + auxDetail.carb;
        todayPerfil.protBreakfast =
            todayPerfil.protBreakfast + auxDetail.protein;
        todayPerfil.fatBreakfast = todayPerfil.fatBreakfast + auxDetail.fat;
        // print('ResumedPerfilList totalConsumed - Café da Manhã: ${todayPerfil.calorieBreakfast}');
      } else if (typeMeal == 'Almoço') {
        todayPerfil.calorieLunch =
            todayPerfil.calorieLunch + auxDetail.quantityCal;
        todayPerfil.carbLunch = todayPerfil.carbLunch + auxDetail.carb;
        todayPerfil.protLunch = todayPerfil.protLunch + auxDetail.protein;
        todayPerfil.fatLunch = todayPerfil.fatLunch + auxDetail.fat;
        // print('ResumedPerfilList totalConsumed - Almoço: ${todayPerfil.calorieLunch}');
      } else if (typeMeal == 'Lanche') {
        todayPerfil.calorieSnack =
            todayPerfil.calorieSnack + auxDetail.quantityCal;
        todayPerfil.carbSnack = todayPerfil.carbSnack + auxDetail.carb;
        todayPerfil.protSnack = todayPerfil.protSnack + auxDetail.protein;
        todayPerfil.fatSnack = todayPerfil.fatSnack + auxDetail.fat;
        // print('ResumedPerfilList totalConsumed - Lanche: ${todayPerfil.calorieSnack}');
      } else {
        todayPerfil.calorieDinner =
            todayPerfil.calorieDinner + auxDetail.quantityCal;
        todayPerfil.carbDinner = todayPerfil.carbDinner + auxDetail.carb;
        todayPerfil.protDinner = todayPerfil.protDinner + auxDetail.protein;
        todayPerfil.fatDinner = todayPerfil.fatDinner + auxDetail.fat;
        // print('ResumedPerfilList totalConsumed - Jantar: ${todayPerfil.calorieDinner}');
      }
    });
    addTodayResumed(todayPerfil);
    consumedCalorie = todayPerfil.calorieBreakfast +
        todayPerfil.calorieDinner +
        todayPerfil.calorieLunch +
        todayPerfil.calorieSnack;
  }

  @action
  void resetCounterCalorie(ResumedPerfil resumedPerfil) {
    resumedPerfil.calorieBreakfast = 0;
    resumedPerfil.calorieDinner = 0;
    resumedPerfil.calorieLunch = 0;
    resumedPerfil.calorieSnack = 0;
    // ResumedPerfil perfil = resetMacros(resumedPerfil);
    // Modifique a variável observável para notificar sobre mudanças nos dados
    showMacrosDataChanged = !showMacrosDataChanged;
    addTodayResumed(resumedPerfil);
  }

  ResumedPerfil resetMacros(ResumedPerfil perfil) {
    perfil.carbDinner = 0;
    perfil.carbLunch = 0;
    perfil.carbBreakfast = 0;
    perfil.carbSnack = 0;
    perfil.protDinner = 0;
    perfil.protLunch = 0;
    perfil.protBreakfast = 0;
    perfil.protSnack = 0;
    perfil.fatDinner = 0;
    perfil.fatLunch = 0;
    perfil.fatBreakfast = 0;
    perfil.fatSnack = 0;
    return perfil;
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

    int index = _resumedPerfil
        .indexWhere((searchPerfil) => searchPerfil.id == perfil.id);
    if (index != -1) {
      _resumedPerfil[index].userId = idUser;
    }
  }

  @action
  void addTodayResumed(ResumedPerfil todayPerfil) {
    _resumedPerfil.removeWhere((toRemove) => toRemove.id == todayPerfil.id);
    _resumedPerfil.add(todayPerfil);
  }
}
