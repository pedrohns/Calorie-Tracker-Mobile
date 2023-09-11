// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_calories_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MealCaloriesList on _MealCaloriesList, Store {
  late final _$_mealCaloriesAtom =
      Atom(name: '_MealCaloriesList._mealCalories', context: context);

  @override
  ObservableList<MealCalorie> get _mealCalories {
    _$_mealCaloriesAtom.reportRead();
    return super._mealCalories;
  }

  @override
  set _mealCalories(ObservableList<MealCalorie> value) {
    _$_mealCaloriesAtom.reportWrite(value, super._mealCalories, () {
      super._mealCalories = value;
    });
  }

  late final _$consumedCalorieAtom =
      Atom(name: '_MealCaloriesList.consumedCalorie', context: context);

  @override
  int get consumedCalorie {
    _$consumedCalorieAtom.reportRead();
    return super.consumedCalorie;
  }

  @override
  set consumedCalorie(int value) {
    _$consumedCalorieAtom.reportWrite(value, super.consumedCalorie, () {
      super.consumedCalorie = value;
    });
  }

  late final _$_MealCaloriesListActionController =
      ActionController(name: '_MealCaloriesList', context: context);

  @override
  void totalConsumed(List<Meal> meals, FoodDetailsList foodsDetails) {
    final _$actionInfo = _$_MealCaloriesListActionController.startAction(
        name: '_MealCaloriesList.totalConsumed');
    try {
      return super.totalConsumed(meals, foodsDetails);
    } finally {
      _$_MealCaloriesListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consumedCalorie: ${consumedCalorie}
    ''';
  }
}
