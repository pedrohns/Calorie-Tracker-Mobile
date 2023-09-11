class MealCalorie{
  final int? calorieBreakfast;
  final int? calorieLunch;
  final int? calorieSnack;
  final int? calorieDinner;
  final DateTime day;
  final String id;

  MealCalorie({
    this.calorieBreakfast,
    this.calorieDinner,
    this.calorieLunch,
    this.calorieSnack,
    required this.day,
    required this.id,
  });
}