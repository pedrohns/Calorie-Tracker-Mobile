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

  late final _$_ManageStateActionController =
      ActionController(name: '_ManageState', context: context);

  @override
  void createSearch() {
    final _$actionInfo = _$_ManageStateActionController.startAction(
        name: '_ManageState.createSearch');
    try {
      return super.createSearch();
    } finally {
      _$_ManageStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancelSearch() {
    final _$actionInfo = _$_ManageStateActionController.startAction(
        name: '_ManageState.cancelSearch');
    try {
      return super.cancelSearch();
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
  String toString() {
    return '''
isSearching: ${isSearching},
canLoad: ${canLoad}
    ''';
  }
}
