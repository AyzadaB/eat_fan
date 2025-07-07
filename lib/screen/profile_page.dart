import 'package:eat_fun/widgets/categories_card_widget.dart';
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

  final List<Map<String, String>> cardItems = [
    {'icon': 'assets/images/pizzaIcon.png', 'label': "Pizza"},
    {'icon': 'assets/images/burgerIcon.png', 'label': "Burger"},
    {'icon': 'assets/images/salad.png', 'label': "Salad"},
    {'icon': 'assets/images/dessertIcon.png', 'label': "Dessert"},
    {'icon': 'assets/images/drinkIcon.png', 'label': "Drink"},
  ];

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
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final item = cardItems[index];
                      final isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: CategoriesCardWidget(
                          isSelected: isSelected,
                          iconPath: item['icon']!,
                          label: item['label']!,
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
                        "Burgers",
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
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final isSelected = selectedIndex == index;
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 200,
                              width: 170,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors:
                                      isSelected
                                          ? [
                                            Color(0xFFBE0127),
                                            Color(0xFFF13A21),
                                          ]
                                          : [Colors.white, Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  isSelected
                                      ? BoxShadow(
                                        color: Color(0xFFF13A21),
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                        offset: Offset(0, 4),
                                      )
                                      : BoxShadow(
                                        color: Color.fromRGBO(
                                          170,
                                          163,
                                          163,
                                          0.247,
                                        ),
                                        blurRadius: 4,
                                        spreadRadius: 5,
                                        offset: Offset(0, 4),
                                      ),
                                ],
                              ),
                              child: Image.asset('assets/images/pizzaIcon.png'),
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
