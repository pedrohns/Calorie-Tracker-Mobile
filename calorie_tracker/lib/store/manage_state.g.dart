// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageState on _ManageState, Store {
  late final _$isSearchingAtom =
      Atom(name: '_ManageState.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$canLoadAtom =
      Atom(name: '_ManageState.canLoad', context: context);

  @override
  bool get canLoad {
    _$canLoadAtom.reportRead();
    return super.canLoad;
  }

  @override
  set canLoad(bool value) {
    _$canLoadAtom.reportWrite(value, super.canLoad, () {
      super.canLoad = value;
    });
  }

  late final _$mealTitleAtom =
      Atom(name: '_ManageState.mealTitle', context: context);

  @override
  String get mealTitle {
    _$mealTitleAtom.reportRead();
    return super.mealTitle;
  }

  @override
  set mealTitle(String value) {
    _$mealTitleAtom.reportWrite(value, super.mealTitle, () {
      super.mealTitle = value;
    });
  }

  late final _$idUserAtom = Atom(name: '_ManageState.idUser', context: context);

  @override
  String get idUser {
    _$idUserAtom.reportRead();
    return super.idUser;
  }

  @override
  set idUser(String value) {
    _$idUserAtom.reportWrite(value, super.idUser, () {
      super.idUser = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_ManageState.fetchData', context: context);

  @override
  Future<void> fetchData(
      String search, Map<String, dynamic> generalController) {
    return _$fetchDataAsyncAction
        .run(() => super.fetchData(search, generalController));
  }

  late final _$setUserDataAsyncAction =
      AsyncAction('_ManageState.setUserData', context: context);

  @override
  Future<void> setUserData(String rowid) {
    return _$setUserDataAsyncAction.run(() => super.setUserData(rowid));
  }

  late final _$_ManageStateActionController =
      ActionController(name: '_ManageState', context: context);

  @override
  void setSearch(bool isReady) {
    final _$actionInfo = _$_ManageStateActionController.startAction(
        name: '_ManageState.setSearch');
    try {
      return super.setSearch(isReady);
    } finally {
      _$_ManageStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoad(bool isReady) {
    final _$actionInfo = _$_ManageStateActionController.startAction(
        name: '_ManageState.setLoad');
    try {
      return super.setLoad(isReady);
    } finally {
      _$_ManageStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void whichMeal(String which) {
    final _$actionInfo = _$_ManageStateActionController.startAction(
        name: '_ManageState.whichMeal');
    try {
      return super.whichMeal(which);
    } finally {
      _$_ManageStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSearching: ${isSearching},
canLoad: ${canLoad},
mealTitle: ${mealTitle},
idUser: ${idUser}
    ''';
  }
}
