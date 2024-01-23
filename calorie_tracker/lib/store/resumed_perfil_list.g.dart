// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumed_perfil_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResumedPerfilList on _ResumedPerfilList, Store {
  Computed<List<ResumedPerfil>>? _$perfilComputed;

  @override
  List<ResumedPerfil> get perfil =>
      (_$perfilComputed ??= Computed<List<ResumedPerfil>>(() => super.perfil,
              name: '_ResumedPerfilList.perfil'))
          .value;
  Computed<ResumedPerfil>? _$todayResumedPerfilComputed;

  @override
  ResumedPerfil get todayResumedPerfil => (_$todayResumedPerfilComputed ??=
          Computed<ResumedPerfil>(() => super.todayResumedPerfil,
              name: '_ResumedPerfilList.todayResumedPerfil'))
      .value;

  late final _$_resumedPerfilAtom =
      Atom(name: '_ResumedPerfilList._resumedPerfil', context: context);

  @override
  ObservableList<ResumedPerfil> get _resumedPerfil {
    _$_resumedPerfilAtom.reportRead();
    return super._resumedPerfil;
  }

  @override
  set _resumedPerfil(ObservableList<ResumedPerfil> value) {
    _$_resumedPerfilAtom.reportWrite(value, super._resumedPerfil, () {
      super._resumedPerfil = value;
    });
  }

  late final _$consumedCalorieAtom =
      Atom(name: '_ResumedPerfilList.consumedCalorie', context: context);

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

  late final _$_ResumedPerfilListActionController =
      ActionController(name: '_ResumedPerfilList', context: context);

  @override
  void totalConsumed([DateTime? dayPassed]) {
    final _$actionInfo = _$_ResumedPerfilListActionController.startAction(
        name: '_ResumedPerfilList.totalConsumed');
    try {
      return super.totalConsumed(dayPassed);
    } finally {
      _$_ResumedPerfilListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetCounterCalorie(ResumedPerfil resumedPerfil) {
    final _$actionInfo = _$_ResumedPerfilListActionController.startAction(
        name: '_ResumedPerfilList.resetCounterCalorie');
    try {
      return super.resetCounterCalorie(resumedPerfil);
    } finally {
      _$_ResumedPerfilListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addResumedPerfil(ResumedPerfil perfil) {
    final _$actionInfo = _$_ResumedPerfilListActionController.startAction(
        name: '_ResumedPerfilList.addResumedPerfil');
    try {
      return super.addResumedPerfil(perfil);
    } finally {
      _$_ResumedPerfilListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void teste() {
    final _$actionInfo = _$_ResumedPerfilListActionController.startAction(
        name: '_ResumedPerfilList.teste');
    try {
      return super.teste();
    } finally {
      _$_ResumedPerfilListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addIdUser(ResumedPerfil perfil, String idUser) {
    final _$actionInfo = _$_ResumedPerfilListActionController.startAction(
        name: '_ResumedPerfilList.addIdUser');
    try {
      return super.addIdUser(perfil, idUser);
    } finally {
      _$_ResumedPerfilListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodayResumed(ResumedPerfil todayPerfil) {
    final _$actionInfo = _$_ResumedPerfilListActionController.startAction(
        name: '_ResumedPerfilList.addTodayResumed');
    try {
      return super.addTodayResumed(todayPerfil);
    } finally {
      _$_ResumedPerfilListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consumedCalorie: ${consumedCalorie},
perfil: ${perfil},
todayResumedPerfil: ${todayResumedPerfil}
    ''';
  }
}
