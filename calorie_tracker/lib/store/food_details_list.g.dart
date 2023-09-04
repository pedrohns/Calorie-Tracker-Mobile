// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_details_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FoodDetailsList on _FoodDetailsList, Store {
  Computed<List<FoodDetails>>? _$foodsDetailsComputed;

  @override
  List<FoodDetails> get foodsDetails => (_$foodsDetailsComputed ??=
          Computed<List<FoodDetails>>(() => super.foodsDetails,
              name: '_FoodDetailsList.foodsDetails'))
      .value;

  late final _$_foodDetailsAtom =
      Atom(name: '_FoodDetailsList._foodDetails', context: context);

  @override
  ObservableList<FoodDetails> get _foodDetails {
    _$_foodDetailsAtom.reportRead();
    return super._foodDetails;
  }

  @override
  set _foodDetails(ObservableList<FoodDetails> value) {
    _$_foodDetailsAtom.reportWrite(value, super._foodDetails, () {
      super._foodDetails = value;
    });
  }

  late final _$searchResultsAtom =
      Atom(name: '_FoodDetailsList.searchResults', context: context);

  @override
  ObservableList<FoodDetails> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<FoodDetails> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  late final _$_FoodDetailsListActionController =
      ActionController(name: '_FoodDetailsList', context: context);

  @override
  void addFoodDetails(FoodDetails data) {
    final _$actionInfo = _$_FoodDetailsListActionController.startAction(
        name: '_FoodDetailsList.addFoodDetails');
    try {
      return super.addFoodDetails(data);
    } finally {
      _$_FoodDetailsListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanFoodDetails() {
    final _$actionInfo = _$_FoodDetailsListActionController.startAction(
        name: '_FoodDetailsList.cleanFoodDetails');
    try {
      return super.cleanFoodDetails();
    } finally {
      _$_FoodDetailsListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSearch(FoodDetails data) {
    final _$actionInfo = _$_FoodDetailsListActionController.startAction(
        name: '_FoodDetailsList.addSearch');
    try {
      return super.addSearch(data);
    } finally {
      _$_FoodDetailsListActionController.endAction(_$actionInfo);
    }
  }

  @override
  FoodDetails getDetailById(String id) {
    final _$actionInfo = _$_FoodDetailsListActionController.startAction(
        name: '_FoodDetailsList.getDetailById');
    try {
      return super.getDetailById(id);
    } finally {
      _$_FoodDetailsListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchResults: ${searchResults},
foodsDetails: ${foodsDetails}
    ''';
  }
}
