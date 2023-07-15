class User {
  final double targetCalorie;
  final int dairyExercice;
  final double consumedCalorie;
  final int waterConsumed;
  final int? alcohoolConsumed;
  final DateTime? timedExercized;
  final String id;
  final String? login;
  final String? password;
  User({
    required this.targetCalorie,
    this.dairyExercice = 0,
    this.consumedCalorie = 0,
    this.waterConsumed = 0,
    this.alcohoolConsumed,
    this.timedExercized,
    required this.id,
    this.login,
    this.password,
  });
}
