import 'package:calorie_tracker/components/DairyPage/show_foods_meal.dart';
import 'package:flutter/material.dart';
import 'package:calorie_tracker/data/dummy_data.dart';
import 'package:calorie_tracker/model/user.dart';
import 'package:calorie_tracker/components/DairyPage/type_meal.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DairyPage extends StatefulWidget {
  const DairyPage({Key? key}) : super(key: key);

  @override
  State<DairyPage> createState() => _DairyPageState();
}

class _DairyPageState extends State<DairyPage> {
  User user = userData;
  List<Map<String, dynamic>> titles = [
    {
      'title': 'Café da Manhã',
      'hasButton': false,
      'secondTitle': 'Café da Manhã',
    },
    {
      'title': 'Adicionar Alimento',
      'hasButton': true,
      'secondTitle': 'Café da Manhã',
    },
    {
      'title': 'Almoço',
      'hasButton': false,
      'secondTitle': 'Almoço',
    },
    {
      'title': 'Adicionar Alimento',
      'hasButton': true,
      'secondTitle': 'Almoço',
    },
    {
      'title': 'Lanche',
      'hasButton': false,
      'secondTitle': 'Lanche',
    },
    {
      'title': 'Adicionar Alimento',
      'hasButton': true,
      'secondTitle': 'Lanche',
    },
    {
      'title': 'Jantar',
      'hasButton': false,
      'secondTitle': 'Jantar',
    },
    {
      'title': 'Adicionar Alimento',
      'hasButton': true,
      'secondTitle': 'Jantar',
    },
  ];

  // Isso daqui explodiu minha mente, simplesmente posso fazer desse jeito aqui
  // Widget teste() {
  //   List<Widget> textWidgets = [];

  //   for (var i = 0; i < testeArray.length; i++) {
  //     textWidgets.add(Text('adsksdah'));
  //   }
  //   return Column(
  //     children: textWidgets,
  //   );
  // }

  List<Widget> showTypeMeals(List<Map<String, dynamic>> titles) {
    List<Widget> widgets = [];
    for (Map<String, dynamic> element in titles) {
      String title = element['title'];
      bool hasButton = element['hasButton'];
      String secondTitle = element['secondTitle'];
      if (hasButton) {
        widgets.add(ShowFoodsMeal(title: element['secondTitle']));
      }
      widgets.add(TypeMeal(
        title: title,
        hasButton: hasButton,
        secondTitle: secondTitle,
      ));
    }
    // return Column(
    //   children: widgets,
    // );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight =
        MediaQuery.of(context).size.height - kBottomNavigationBarHeight;
    double totalConsumed =
        user.targetCalorie - user.consumedCalorie + user.dairyExercice;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: mediaQueryHeight * 0.16,
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.only(
            left: 20.0,
            top: 10.0,
            bottom: 10.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Calorias restantes')],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        user.targetCalorie.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                      SizedBox(height: 2),
                      Text('Meta'),
                    ],
                  ),
                  Text('-'),
                  Column(
                    children: [
                      Text(
                        user.consumedCalorie.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                      SizedBox(height: 2),
                      Text('Alimentos'),
                    ],
                  ),
                  Text('+'),
                  Column(
                    children: [
                      Text(
                        user.dairyExercice.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.bodyMedium!,
                      ),
                      SizedBox(height: 2),
                      Text('Exercício'),
                    ],
                  ),
                  Text('='),
                  Column(
                    children: [
                      Text(
                        totalConsumed.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.titleSmall!,
                      ),
                      SizedBox(height: 2),
                      Text('Restantes'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Fim da primeira parte
        Expanded(
          child: ListView(
            children: showTypeMeals(titles),
          ),
        ),
      ],
    );
  }
}
