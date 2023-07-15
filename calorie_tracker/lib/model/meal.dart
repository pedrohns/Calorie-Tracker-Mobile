class Meal {
  final List<dynamic>? breakfast;
  final List<dynamic>? lunch;
  final List<dynamic>? dinner;
  final List<dynamic>? snack;
  final String id;

  Meal({
    required this.id,
    this.breakfast,
    this.snack,
    this.lunch,
    this.dinner,
  });
}
