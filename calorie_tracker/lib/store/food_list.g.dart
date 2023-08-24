// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodList on _FoodList, Store {
  Computed<List<Food>>? _$foodsComputed;

  @override
  List<Food> get foods => (_$foodsComputed ??=
          Computed<List<Food>>(() => super.foods, name: '_FoodList.foods'))
      .value;

  late final _$_foodsAtom = Atom(name: '_FoodList._foods', context: context);

  @override
  ObservableList<Food> get _foods {
    _$_foodsAtom.reportRead();
    return super._foods;
  }

  @override
  set _foods(ObservableList<Food> value) {
    _$_foodsAtom.reportWrite(value, super._foods, () {
      super._foods = value;
    });
  }

  late final _$_FoodListActionController =
      ActionController(name: '_FoodList', context: context);

  @override
  void addFood(Food data) {
    final _$actionInfo =
        _$_FoodListActionController.startAction(name: '_FoodList.addFood');
    try {
      return super.addFood(data);
    } finally {
      _$_FoodListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanFood() {
    final _$actionInfo =
        _$_FoodListActionController.startAction(name: '_FoodList.cleanFood');
    try {
      return super.cleanFood();
    } finally {
      _$_FoodListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foods: ${foods}
    ''';
  }
}
