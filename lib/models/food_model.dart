class FoodModel {
  FoodModel({
    required this.icon,
    required this.label,
    required this.rating,
    required this.price,
    required this.category,
  });

  final String icon;
  final String label;
  final int rating;
  final String price;
  final String category;

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      icon: map['icon'],
      label: map['label'],
      rating: map['rating'],
      price: map['price'],
      category: map['category'],
    );
  }
}
