import 'dart:io';
import 'package:calorie_tracker/network/http_overrides.dart';
import 'package:calorie_tracker/store/food_details_list.dart';
import 'package:calorie_tracker/store/food_list.dart';
import 'package:calorie_tracker/store/manage_state.dart';
import 'package:calorie_tracker/store/meal_list.dart';
import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:calorie_tracker/view/food_page.dart';
import 'package:calorie_tracker/view/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodList>(
          create: (_) => FoodList(),
        ),
        Provider<FoodDetailsList>(
          create: (_) => FoodDetailsList(),
        ),
        Provider<ManageState>(
          create: (_) => ManageState(),
        ),
        Provider<MealList>(
          create: (_) => MealList(),
        )
      ],
      child: MaterialApp(
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
          }),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}
