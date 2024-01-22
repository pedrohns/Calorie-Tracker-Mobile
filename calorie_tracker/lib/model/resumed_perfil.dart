class ResumedPerfil{
  int calorieBreakfast;
  int calorieLunch;
  int calorieSnack;
  int calorieDinner;
  final DateTime day;
  final String id;
  String userId;

  ResumedPerfil({
    this.calorieBreakfast = 0,
    this.calorieDinner = 0,
    this.calorieLunch = 0,
    this.calorieSnack = 0,
    required this.day,
    required this.id,
    this.userId = '',
  });
}