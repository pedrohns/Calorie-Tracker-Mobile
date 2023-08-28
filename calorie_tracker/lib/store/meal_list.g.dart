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
meals: ${meals}
    ''';
  }
}
