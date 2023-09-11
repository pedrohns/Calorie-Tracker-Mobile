// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MealList on _MealList, Store {
  Computed<List<Meal>>? _$mealsComputed;

  @override
  List<Meal> get meals => (_$mealsComputed ??=
          Computed<List<Meal>>(() => super.meals, name: '_MealList.meals'))
      .value;
  Computed<List<Meal>>? _$breakfastMealsComputed;

  @override
  List<Meal> get breakfastMeals => (_$breakfastMealsComputed ??=
          Computed<List<Meal>>(() => super.breakfastMeals,
              name: '_MealList.breakfastMeals'))
      .value;
  Computed<List<Meal>>? _$lunchMealsComputed;

  @override
  List<Meal> get lunchMeals =>
      (_$lunchMealsComputed ??= Computed<List<Meal>>(() => super.lunchMeals,
              name: '_MealList.lunchMeals'))
          .value;
  Computed<List<Meal>>? _$snackMealsComputed;

  @override
  List<Meal> get snackMeals =>
      (_$snackMealsComputed ??= Computed<List<Meal>>(() => super.snackMeals,
              name: '_MealList.snackMeals'))
          .value;
  Computed<List<Meal>>? _$dinnerMealsComputed;

  @override
  List<Meal> get dinnerMeals =>
      (_$dinnerMealsComputed ??= Computed<List<Meal>>(() => super.dinnerMeals,
              name: '_MealList.dinnerMeals'))
          .value;
  Computed<List<Meal>>? _$currentMealsComputed;

  @override
  List<Meal> get currentMeals =>
      (_$currentMealsComputed ??= Computed<List<Meal>>(() => super.currentMeals,
              name: '_MealList.currentMeals'))
          .value;

  late final _$_mealsAtom = Atom(name: '_MealList._meals', context: context);

  @override
  ObservableList<Meal> get _meals {
    _$_mealsAtom.reportRead();
    return super._meals;
  }

  @override
  set _meals(ObservableList<Meal> value) {
    _$_mealsAtom.reportWrite(value, super._meals, () {
      super._meals = value;
    });
  }

  late final _$_mealCaloriesAtom =
      Atom(name: '_MealList._mealCalories', context: context);

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

  late final _$currentMealTitleAtom =
      Atom(name: '_MealList.currentMealTitle', context: context);

  @override
  String get currentMealTitle {
    _$currentMealTitleAtom.reportRead();
    return super.currentMealTitle;
  }

  @override
  set currentMealTitle(String value) {
    _$currentMealTitleAtom.reportWrite(value, super.currentMealTitle, () {
      super.currentMealTitle = value;
    });
  }

  late final _$consumedCalorieAtom =
      Atom(name: '_MealList.consumedCalorie', context: context);

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

  late final _$_MealListActionController =
      ActionController(name: '_MealList', context: context);

  @override
  void addMeal(Meal data) {
    final _$actionInfo =
        _$_MealListActionController.startAction(name: '_MealList.addMeal');
    try {
      return super.addMeal(data);
    } finally {
      _$_MealListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void totalConsumed(List<Meal> meals, FoodDetailsList foodsDetails) {
    final _$actionInfo = _$_MealListActionController.startAction(
        name: '_MealList.totalConsumed');
    try {
      return super.totalConsumed(meals, foodsDetails);
    } finally {
      _$_MealListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentMealTitle(String title) {
    final _$actionInfo = _$_MealListActionController.startAction(
        name: '_MealList.setCurrentMealTitle');
    try {
      return super.setCurrentMealTitle(title);
    } finally {
      _$_MealListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanMeal() {
    final _$actionInfo =
        _$_MealListActionController.startAction(name: '_MealList.cleanMeal');
    try {
      return super.cleanMeal();
    } finally {
      _$_MealListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentMealTitle: ${currentMealTitle},
consumedCalorie: ${consumedCalorie},
meals: ${meals},
breakfastMeals: ${breakfastMeals},
lunchMeals: ${lunchMeals},
snackMeals: ${snackMeals},
dinnerMeals: ${dinnerMeals},
currentMeals: ${currentMeals}
    ''';
  }
}
