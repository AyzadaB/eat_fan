import 'package:eat_fun/models/category_model.dart';
import 'package:eat_fun/models/food_model.dart';

final List<CategoryModel> appCategories = [
  CategoryModel(icon: 'assets/icons/pizzaIcon.png', label: 'Pizza'),
  CategoryModel(icon: 'assets/icons/burgerIcon.png', label: 'Burger'),
  CategoryModel(icon: 'assets/icons/salad.png', label: 'Salad'),
  CategoryModel(icon: 'assets/icons/dessertIcon.png', label: 'Dessert'),
  CategoryModel(icon: 'assets/icons/drinkIcon.png', label: 'Drink'),
];

final List<FoodModel> appFoodItems = [
  FoodModel(
    icon: 'assets/images/hamburger1.png',
    label: "Chicken Burger",
    rating: 5,
    price: "RS 150",
    category: 'Burger',
  ),
  FoodModel(
    icon: 'assets/images/doubleCheesburger.png',
    label: "Chicken Burger",
    rating: 7,
    price: "RS 200",
    category: 'Burger',
  ),
  FoodModel(
    icon: 'assets/images/doubleCheesburger.png',
    label: "Chicken Burger",
    rating: 7,
    price: "RS 200",
    category: 'Burger',
  ),
  FoodModel(
    icon: 'assets/images/doubleCheesburger.png',
    label: "Chicken Burger",
    rating: 7,
    price: "RS 200",
    category: 'Burger',
  ),
  FoodModel(
    icon: 'assets/images/bigPizza.png',
    label: "Chicken Burger",
    rating: 7,
    price: "RS 200",
    category: 'Burger',
  ),
];
