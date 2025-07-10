import 'package:eat_fun/data/app_data.dart';
import 'package:eat_fun/models/category_model.dart';
import 'package:eat_fun/models/food_model.dart';
import 'package:eat_fun/widgets/categories_card_widget.dart';
import 'package:eat_fun/widgets/food_card_widget.dart';
import 'package:eat_fun/widgets/menu_and_profile.dart';
import 'package:eat_fun/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _searchController = TextEditingController();
  bool isSelected = false;
  int selectedIndex = -1;
  int selectedCategoryIndex = 0;

  List<FoodModel> get filteredFoodItems {
    final selectedCategory = appCategories[selectedCategoryIndex].label;
    return appFoodItems
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/Ellipse 1.png'),
              Image.asset('assets/images/Ellipse 2.png'),
              MenuAndProfile(),
              Positioned(
                top: 70,
                left: 28,
                child: Text(
                  "Choose the\nFOOD you LOVE",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 28,
                child: SearchFieldWidget(controller: _searchController),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: appCategories.length,
                    itemBuilder: (context, index) {
                      final CategoryModel item = appCategories[index];
                      final isSelected = selectedCategoryIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                            selectedIndex = -1;
                          });
                        },
                        child: CategoriesCardWidget(
                          isSelected: isSelected,
                          iconPath: item.icon,
                          label: item.label,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 27),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        appCategories[selectedCategoryIndex].label,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    SizedBox(
                      height: 240,
                      child: ListView.builder(
                        itemCount: filteredFoodItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final isSelected = selectedIndex == index;
                          final FoodModel item = filteredFoodItems[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: FoodCardWidget(
                              isSelected: isSelected,
                              image: item.icon,
                              label: item.label,
                              rating: item.rating,
                              price: item.price,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
