class User {
  final double targetCalorie;
  final int dairyExercice;
  final double consumedCalorie;
  final int waterConsumed;
  final int? alcohoolConsumed;
  final DateTime? timedExecized;
  User({
    required this.targetCalorie,
    this.dairyExercice = 0,
    this.consumedCalorie = 0,
    this.waterConsumed = 0,
    this.alcohoolConsumed,
    this.timedExecized,
  });
}
