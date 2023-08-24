class Food {
  final String name;
  final int? portion;
  final double? sizePortion;
  final String id;
  final String? legend;

  Food({
    required this.id,
    this.portion,
    this.sizePortion,
    required this.name,
    this.legend,
  });
}