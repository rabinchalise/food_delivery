//food items
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  final List<Addon> availableAddons;

  Food(
      {required this.name,
      required this.category,
      required this.availableAddons,
      required this.description,
      required this.imagePath,
      required this.price});
}

// food category
enum FoodCategory { burgers, salads, sides, desserts, drinks }

// food addons
class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
