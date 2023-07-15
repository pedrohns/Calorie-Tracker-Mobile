class FoodDetails {
  final int quantityCal;
  final int carb;
  final int fat;
  final int protein;
  final String id;
  final String foodId;
  final int? fiber;
  final int? sugar;

  FoodDetails({
    this.fiber,
    this.sugar,
    required this.quantityCal,
    required this.carb,
    required this.fat,
    required this.protein,
    required this.id,
    required this.foodId,
  });
}
