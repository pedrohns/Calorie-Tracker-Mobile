import 'package:calorie_tracker/view/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
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
              bodySmall: const TextStyle(
                  //headline5
                  fontSize: 13,
                  fontFamily: 'OpenSans',
                  color: Color.fromRGBO(255, 255, 255, 1)),
            ),
        appBarTheme:
            AppBarTheme(backgroundColor: Color.fromRGBO(21, 23, 35, 0.86)),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}
