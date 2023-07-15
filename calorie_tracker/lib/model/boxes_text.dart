import 'package:flutter/material.dart';
import 'package:calorie_tracker/data/dummy_data.dart';

class BoxesText {
  final String whatBox;
  BoxesText({
    required this.whatBox,
  });

  final user = userData;

  String getTitle() {
    if (whatBox == 'Water') {
      return 'Hidratação';
    }
    return 'Exercícios';
  }

  List<String> posFixString() {
    if (whatBox == 'Water') {
      return ['mL'];
    }
    return ['cal', 'h'];
  }

  Map<String, dynamic> getValues() {
    if (whatBox == 'Water') {
      return {
        'value1': user.waterConsumed,
        'value2': user.alcohoolConsumed!,
      };
    }
    return {
      'value1': user.dairyExercice,
      'value2': (user.timedExercized) ?? DateTime.now(),
    };
  }

  Map<String, Icon> getIcons() {
    if (whatBox == 'Water') {
      return {
        'icon1': Icon(
          Icons.water_drop,
          color: Colors.blueAccent,
          size: 30,
        ),
        'icon2': Icon(
          Icons.sports_bar,
          color: Color.fromARGB(190, 255, 235, 59),
          size: 30,
        ),
      };
    }
    return {
      'icon1': Icon(
        Icons.whatshot_rounded,
        color: Colors.orangeAccent,
      ),
      'icon2': Icon(
        Icons.timer,
        color: Colors.orangeAccent,
      ),
    };
  }
}
