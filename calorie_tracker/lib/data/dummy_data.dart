import 'package:calorie_tracker/model/user.dart';

final User userData = User(
  targetCalorie: 2500,
  dairyExercice: 400,
  consumedCalorie: 2300,
  waterConsumed: 3000,
  alcohoolConsumed: 1000,
  id: '1',
);
//List<User> get dummyData => [..._dummyData];

List<WeightData> getWeightData() {
  final List<WeightData> chartData = [
    WeightData(99.5, 1),
    WeightData(99.5, 2),
    WeightData(99, 3),
    WeightData(98, 4),
    WeightData(97.5, 5),
    WeightData(97, 6),
  ];
  return chartData;
}

List<WeightData> weightData = getWeightData();

class WeightData {
  WeightData(this.weight, this.day);
  final double weight;
  final double day;
}
