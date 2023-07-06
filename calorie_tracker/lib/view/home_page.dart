import 'package:calorie_tracker/components/calorie_review.dart';
import 'package:calorie_tracker/components/water_exercice_review.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calorie Tracker',
            style: Theme.of(context).textTheme.headline1!,
          ),
          leading: Image.asset(
            'assets/img/male_user.png', // caminho para o arquivo de imagem
            fit: BoxFit.contain,
            color: Colors.lightBlueAccent, // ajustar a imagem dentro do AppBar
          ),
        ),
        body: Container(
          color: Color.fromRGBO(18, 19, 29, 0.859), // cor principal
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
                  child: Text(
                    'Box 4',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.headline6!.color,
                      fontFamily:
                          Theme.of(context).textTheme.headline6!.fontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
