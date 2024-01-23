import 'package:calorie_tracker/model/resumed_perfil.dart';
import 'package:calorie_tracker/store/resumed_perfil_list.dart';
import 'package:calorie_tracker/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:calorie_tracker/data/dummy_data.dart';
// import 'package:calorie_tracker/model/user.dart';
import 'package:get_it/get_it.dart';

class CalorieReview extends StatelessWidget {
  CalorieReview({key});
  final user = userData;
  ResumedPerfil perfil = GetIt.I.get<ResumedPerfilList>().todayResumedPerfil;
  int totalCalorieConsumed = 0;

  // Tive que colocar a inicialização do map dentro do build,porque as expressões de inicialização
  //são avaliadas antes que o construtor do objeto seja executado,
  //assim ele estava iniciando antes do objeto dummy

  @override
  Widget build(BuildContext context) {
    totalCalorieConsumed = perfil.calorieBreakfast +
        perfil.calorieDinner +
        perfil.calorieLunch +
        perfil.calorieSnack;
    final Map<String, double> dataMap = {
      // 'Calorias': user.consumedCalorie,
      'Calorias': totalCalorieConsumed.toDouble()
    };
    final colorList = <Color>[
      Theme.of(context).colorScheme.secondary,
    ];
    final headlineTitulo = Theme.of(context).textTheme.titleLarge!;
    final headlineCorpo = Theme.of(context).textTheme.titleMedium!;
    final headlineNumbers = Theme.of(context).textTheme.titleSmall!;
    final int leftoverCalorie =
        (user.targetCalorie - totalCalorieConsumed).toInt();
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(AppRoutes.dairy);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Calorias', style: headlineTitulo),
          SizedBox(height: 3),
          Text(
            'Restantes = Meta - Alimento',
            style: headlineCorpo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // CircleAvatar(),
              Stack(
                //envolvendo o PieChart em uma Stack para colocar o texto dentro
                children: [
                  PieChart(
                    dataMap: dataMap,
                    chartRadius: MediaQuery.of(context).size.width / 4.4,
                    ringStrokeWidth: 4,
                    chartType: ChartType.ring,
                    baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                    colorList: colorList,
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValues: false,
                    ),
                    totalValue: user.targetCalorie,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "$leftoverCalorie\n Restantes",
                        style: headlineCorpo,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.flag,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Meta base',
                              style: headlineCorpo,
                            ),
                            Text(
                              user.targetCalorie.toStringAsFixed(0),
                              style: headlineNumbers,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.dining,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alimentos',
                              style: headlineCorpo,
                            ),
                            Text(
                              totalCalorieConsumed.toStringAsFixed(0),
                              style: headlineNumbers,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.whatshot_rounded,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Exercício',
                              style: headlineCorpo,
                            ),
                            Text(
                              user.dairyExercice.toString(),
                              style: headlineNumbers,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
