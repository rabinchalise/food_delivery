import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';

class Resturants extends ChangeNotifier {
  // list of food menu

  final List<Food> _foodMenu = [
    // burgers

    Food(
        name: "Classic Cheeseburger",
        description:
            'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle',
        imagePath: 'assets/images/burger/cheese.jpg',
        price: 8.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Extra Cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99),
        ]),
    Food(
        name: "BBQ Bacon Burger",
        description:
            'Smoky BBQ sauce,cripsy bacon, and onion rings makes this beef burger a savory delight',
        imagePath: 'assets/images/burger/bbq.jpg',
        price: 10.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Grilled Onions', price: 0.99),
          Addon(name: 'Jalapenos', price: 1.49),
          Addon(name: 'Extra BBQ sauce', price: 1.99),
        ]),
    Food(
        name: "Veggie Burger",
        description:
            'A heartly veggie patty tapped with fresh avocado, lettuce, and tomato, served on a whole plate',
        imagePath: 'assets/images/burger/vegie.jpg',
        price: 9.49,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Vegan Cheese', price: 0.99),
          Addon(name: 'Grilled Mushrooms', price: 1.49),
          Addon(name: 'Humas spread', price: 1.99),
        ]),
    Food(
        name: "Aloha Burger",
        description:
            'A char  grilled chicken breast tooped with a slice of spanich , and swiss cheese, served on a whole plate',
        imagePath: 'assets/images/burger/aloha.jpg',
        price: 9.49,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: 'Teriyaki Glaze', price: 0.99),
          Addon(name: 'Extra Pineapple', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
        ]),
    Food(
        name: "Blue Moon Burger",
        description:
            'This burger is a blue cheese lover\'s dream. It fetaures a succulent ground beef patty',
        imagePath: 'assets/images/burger/bluemoon.jpg',
        price: 9.49,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: ' Spauteed Mushrooms', price: 0.99),
          Addon(name: 'Fried Egg', price: 1.49),
          Addon(name: 'Spicy Mayo', price: 0.99),
        ]),
    //salads

    Food(
        name: "Caesar Salad",
        description:
            'Crisp romaine lettuce, parmesan cheese, croutons, and caesar dressing',
        imagePath: 'assets/images/salads/salads4.jpg',
        price: 7.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: ' Grilled Chicken', price: 0.99),
          Addon(name: 'Anchovies', price: 1.49),
          Addon(name: 'Extra Parmesan', price: 1.99),
        ]),
    Food(
        name: "Greek Salad",
        description:
            'Tomatoes, cucumbers, red onions, olives, ferta cheese with olive oil and herbs.',
        imagePath: 'assets/images/salads/salads3.jpg',
        price: 8.49,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: ' Feta Cheese', price: 0.99),
          Addon(name: 'Kalamata Olives', price: 1.49),
          Addon(name: 'Grilled Shrimp', price: 1.99),
        ]),
    Food(
        name: "Quiona Salad",
        description:
            'Quiona mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette',
        imagePath: 'assets/images/salads/salads5.jpg',
        price: 8.49,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: 'Avocado', price: 0.99),
          Addon(name: 'Feta Cheese', price: 1.49),
          Addon(name: 'Grilled Chicken', price: 1.99),
        ]),
    Food(
        name: "Asian Sesame Salad",
        description:
            'Delight in the flavors of East with this sesame_inflused salad. It includes mixed green vegetables and fruits.   ',
        imagePath: 'assets/images/salads/salads1.jpg',
        price: 9.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: ' Mandarian Oranges', price: 0.99),
          Addon(name: 'Almond Silvers', price: 1.49),
          Addon(name: 'Extra Teriyaki Chicken', price: 1.99),
        ]),
    Food(
        name: "South West Chicken Salad",
        description:
            'The colorful salad combines the zesty flavours of Southwest. It is loaded with mixed vegetables and chicken.',
        imagePath: 'assets/images/salads/salads2.jpg',
        price: 9.99,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: ' Sour Cream', price: 0.99),
          Addon(name: 'Pico de Gallo', price: 1.49),
          Addon(name: 'Guacamole', price: 1.99),
        ]),

    //sides
    Food(
        name: "Sweet Potato Fires",
        description: 'Crispy sweet potato fires with a touch of salt.',
        imagePath: 'assets/images/sides/side1.jpg',
        price: 4.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Cheese Sauce', price: 0.99),
          Addon(name: 'Truffle Oil', price: 1.49),
          Addon(name: 'Cajun Spice', price: 1.99),
        ]),
    Food(
        name: "Onion Rings",
        description: 'Golden and crispy onion rings, perfect for dipping',
        imagePath: 'assets/images/sides/side5.jpg',
        price: 3.99,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: ' Ranch Dip', price: 0.99),
          Addon(name: 'Spicy Mayo', price: 1.49),
          Addon(name: 'Parmesan Dust', price: 1.99),
        ]),
    Food(
        name: "Garlic Bread",
        description:
            'Warm and toasty garlic bread, topped with melted butter nd parsley.',
        imagePath: 'assets/images/sides/side3.jpg',
        price: 4.49,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: ' Extra Garlic', price: 0.99),
          Addon(name: 'Mozzarella Cheese', price: 1.49),
          Addon(name: 'Marinara Dip', price: 1.99),
        ]),
    Food(
        name: "Loaded Sweet Potato Fries",
        description:
            'Savory sweet potato fries loaded with melted cheese, smoky bacon bits, and a dollop of sour cream.',
        imagePath: 'assets/images/sides/side3.jpg',
        price: 4.49,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: 'Sour Cream', price: 0.99),
          Addon(name: 'Bacon Bits', price: 1.49),
          Addon(name: 'Green Onions', price: 0.99),
        ]),
    Food(
        name: "Crispy Mac & Cheese Bites",
        description:
            'Golden brwon, bite-sized mac cheese balls, perfect for on-the-go snacking',
        imagePath: 'assets/images/sides/side4.jpg',
        price: 4.49,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: ' Feta Cheese', price: 0.99),
          Addon(name: 'Kalamata Olives', price: 1.49),
          Addon(name: 'Grilled Shrimp', price: 0.99),
        ]),

    // deserts
    Food(
        name: "Chocolate Brownie",
        description:
            'Rich and fudgy chocolate brownie, with chunks of chocolate.',
        imagePath: 'assets/images/deserts/deserts1.jpg',
        price: 5.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Vanilla Ice Cream', price: 0.99),
          Addon(name: 'Hot Fudge', price: 1.49),
          Addon(name: 'Whipped Cream', price: 1.99),
        ]),
    Food(
        name: "Cheesecake",
        description:
            'Creamy cheesecake on a graham cracker crust, with berry compote',
        imagePath: 'assets/images/deserts/deserts5.jpg',
        price: 6.99,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Strawberry Topping', price: 0.99),
          Addon(name: 'Blueberry Compote', price: 1.49),
          Addon(name: 'Chocolate Chips', price: 1.99),
        ]),
    Food(
        name: "Apple Pie",
        description:
            'Classic apple pie with a flaky crust and a cinnamon-spiced apple filling',
        imagePath: 'assets/images/deserts/deserts3.jpg',
        price: 5.49,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Caramel Sauce', price: 0.99),
          Addon(name: 'Vanilla Ice Cream', price: 1.49),
          Addon(name: 'Cinnamon Spice', price: 1.99),
        ]),
    Food(
        name: "Nutcracker Smoothie",
        description: 'It is a smoothie with nuts which very much refreshing',
        imagePath: 'assets/images/deserts/deserts2.jpg',
        price: 6.49,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Caramel Sauce', price: 0.99),
          Addon(name: 'Vanilla Ice Cream', price: 1.49),
          Addon(name: 'Cinnamon Spice', price: 1.99),
        ]),
    Food(
        name: "Red Velvet Lava Cake",
        description:
            'A delectable red velvet cake with a warm, gooey chocolate lava center, serve with chocloate',
        imagePath: 'assets/images/deserts/deserts5.jpg',
        price: 5.49,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: 'Raspberry Sauce', price: 0.99),
          Addon(name: 'Cream Cheese Icing', price: 1.49),
          Addon(name: 'Chocolate Sprinkles', price: 1.99),
        ]),

    //drinks
    Food(
        name: "Lemonade",
        description:
            'Refreshing lemonade made with real lemons and touch of sweetness',
        imagePath: 'assets/images/drinks/drinks2.jpg',
        price: 2.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Strawberry Flavor', price: 0.99),
          Addon(name: 'Mint leaves', price: 1.49),
          Addon(name: 'Ginger Zest', price: 1.99),
        ]),
    Food(
        name: "Iced Tea",
        description: 'Chilled iced tea with a hint of lemon, served over ice',
        imagePath: 'assets/images/drinks/drinks1.jpg',
        price: 2.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Peach Flavor', price: 0.99),
          Addon(name: 'Lemon Slices', price: 1.49),
          Addon(name: 'Honey', price: 1.99),
        ]),
    Food(
        name: "Smoothie",
        description:
            'A blend of fresh fruits and yogurt, perfect for a healthy boost ',
        imagePath: 'assets/images/drinks/drinks3.jpg',
        price: 4.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Protein Powder', price: 0.99),
          Addon(name: 'Almond Milk', price: 1.49),
          Addon(name: 'Chia Seeds', price: 1.99),
        ]),
    Food(
        name: "Mojito",
        description:
            'A classic Cuban cocktail with muddled lime and mint, sweetend with sugar.',
        imagePath: 'assets/images/drinks/drinks5.jpg',
        price: 4.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Extra Mint', price: 0.49),
          Addon(name: 'Raspberry Puree', price: 0.99),
          Addon(name: 'Splash of Coconut Rum', price: 1.99),
        ]),
    Food(
        name: "Caramel Macchiato",
        description:
            'A layered coffe drink with steamed milk, espresso and vanilla syrup',
        imagePath: 'assets/images/drinks/drinks4.jpg',
        price: 4.99,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: 'Extra Shot of Espresso', price: 0.99),
          Addon(name: 'Hazelnut Syrup', price: 0.49),
          Addon(name: 'Wipped Cream', price: 0.99),
        ])
  ];

  List<Food> get menu => _foodMenu;

  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;
  String _deliveryAddress = '99 Hollywood Blv';

  String get deliveryAddress => _deliveryAddress;

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameAddons && isSameFood;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearcart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();

    receipt.writeln('Here\'s your reciept');
    receipt.writeln();

    String formatDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formatDate);
    receipt.writeln();
    receipt.writeln('----------');

    for (final cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} -${_formatPrice(cartItem.food.price)}');
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln('  Add-ons:${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }

    receipt.writeln('----------');
    receipt.writeln();
    receipt.writeln('Total Items:${getTotalItemCount()}');
    receipt.writeln('Total Price:${_formatPrice(getTotalPrice())}');
    receipt.writeln();
    receipt.writeln('Delivering to: $deliveryAddress');

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return '\$ ${price.toStringAsFixed(2)}';
  }

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name}(${_formatPrice(addon.price)})')
        .join(', ');
  }
}

final foodProvider = ChangeNotifierProvider<Resturants>((ref) => Resturants());
