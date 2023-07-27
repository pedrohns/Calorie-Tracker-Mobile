import 'package:calorie_tracker/components/search_box.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({key});

  @override
  Widget build(BuildContext context) {
    final String teste = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 51, 60, 0.763),
      appBar: AppBar(
        title: Text(teste),
      ),
      body: Container(
        // color: Color.fromRGBO(139, 74, 145, 0.859),
        child: SearchBox(),
      ),
    );
  }
}
