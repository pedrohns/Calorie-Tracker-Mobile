class ResumedPerfil {
  int calorieBreakfast;
  int calorieLunch;
  int calorieSnack;
  int calorieDinner;
  final DateTime day;
  final String id;
  String userId;
  int carbBreakfast;
  int carbLunch;
  int carbSnack;
  int carbDinner;
  int protBreakfast;
  int protLunch;
  int protSnack;
  int protDinner;
  int fatBreakfast;
  int fatLunch;
  int fatSnack;
  int fatDinner;

  ResumedPerfil({
    this.calorieBreakfast = 0,
    this.calorieDinner = 0,
    this.calorieLunch = 0,
    this.calorieSnack = 0,
    required this.day,
    required this.id,
    this.userId = '',
    this.carbBreakfast = 0,
    this.carbLunch = 0,
    this.carbSnack = 0,
    this.carbDinner = 0,
    this.protBreakfast = 0,
    this.protLunch = 0,
    this.protSnack = 0,
    this.protDinner = 0,
    this.fatBreakfast = 0,
    this.fatLunch = 0,
    this.fatSnack = 0,
    this.fatDinner = 0,
  });
}
