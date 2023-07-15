import 'package:calorie_tracker/components/calorie_review.dart';
import 'package:calorie_tracker/components/water_exercice_review.dart';
import 'package:calorie_tracker/components/weight_review.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 370,
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
