class Meal {
  final bool breakfast;
  final bool lunch;
  final bool dinner;
  final bool snack;
  final String id;
  final String foodId;

  Meal({
    required this.id,
    this.breakfast = false,
    this.snack = false,
    this.lunch = false,
    this.dinner = false,
    required this.foodId,
  });
}
