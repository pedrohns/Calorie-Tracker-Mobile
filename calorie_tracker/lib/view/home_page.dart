import 'package:calorie_tracker/components/HomePage/calorie_review.dart';
import 'package:calorie_tracker/components/HomePage/water_exercice_review.dart';
import 'package:calorie_tracker/components/HomePage/weight_review.dart';
import 'package:calorie_tracker/model/resumed_perfil.dart';
import 'package:calorie_tracker/store/resumed_perfil_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({key});

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    ResumedPerfilList resumedPerfilList = GetIt.I.get<ResumedPerfilList>();
    ResumedPerfil todayPerfil = resumedPerfilList.todayResumedPerfil;
    print('HomePage build - todayPerfil ${todayPerfil.userId}');
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 200,
              // width: 370,
              width: widthQuery * 1,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CalorieReview(),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WaterExeciceReview(whichBoxes: 'Water'),
              WaterExeciceReview(whichBoxes: 'Exercice'),
            ],
          ),
          WeightReview(),
        ],
      ),
    );
  }
}
