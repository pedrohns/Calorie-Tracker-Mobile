import 'dart:io';
import 'package:calorie_tracker/model/resumed_perfil.dart';
import 'package:calorie_tracker/network/http_overrides.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:calorie_tracker/store/resumed_perfil_list.dart';
import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:calorie_tracker/utils/generate_rowid.dart';
import 'package:calorie_tracker/view/authentication_page.dart';
import 'package:calorie_tracker/view/food_page.dart';
import 'package:calorie_tracker/view/login_page.dart';
import 'package:calorie_tracker/view/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/utils/util_custom.dart';
import 'package:get_it/get_it.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<ManageState>(ManageState());
  getIt.registerSingleton<FoodList>(FoodList());
  getIt.registerSingleton<FoodDetailsList>(FoodDetailsList());
  getIt.registerSingleton<MealList>(MealList());
  getIt.registerSingleton<ResumedPerfilList>(ResumedPerfilList());
  runApp(MyApp());
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    print('InitState fired');

    super.initState();

    // Agendar a função para ser chamada após a construção dos widgets
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('Entro no método addPostFrameCallback');
      // ResumedPerfilList().teste();
      final resumedPerfilList = GetIt.I.get<ResumedPerfilList>();
      // resumedPerfilList.teste();
      String id = GenerateRowid().generate();
      print('Main id: ' + id);
      ResumedPerfil todayProfile =
          ResumedPerfil(day: UtilCustom().getToday(), id: id);

      // Adicione sua instância à lista global ou ao provedor, ou faça o que quiser com ela aqui.
      resumedPerfilList.addResumedPerfil(todayProfile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromARGB(88, 21, 23, 35),
            secondary: const Color.fromRGBO(79, 154, 255, 1),
          ),
          fontFamily: 'OpenSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  //headline6
                  fontSize: 11,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                titleLarge: const TextStyle(
                  //headline1
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                titleSmall: const TextStyle(
                  //headline2
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                bodyMedium: const TextStyle(
                  //headline2
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                bodySmall: const TextStyle(
                    //headline5
                    fontSize: 13,
                    fontFamily: 'OpenSans',
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromRGBO(21, 23, 35, 0.86)),
        ),
        routes: {
          AppRoutes.home: (ctx) => TabsScreen(),
          AppRoutes.dairy: (ctx) => TabsScreen(
                selectedScreenIndex: 1,
              ),
          AppRoutes.food: (ctx) => FoodPage(),
          AppRoutes.login: (ctx) => LoginPage(),
          AppRoutes.index: (ctx) => AuthenticationPage(),
        });
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}
