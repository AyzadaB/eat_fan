import 'package:eat_fun/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class FoodCardWidget extends StatelessWidget {
  FoodCardWidget({
    super.key,
    required this.isSelected,
    required this.image,
    required this.label,
    required this.rating,
    required this.price,
  });

  final bool isSelected;
  final String image;
  final String label;
  final int rating;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: 200,
      width: 170,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:
              isSelected
                  ? [Color(0xFFBE0127), Color(0xFFF13A21)]
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
                color: Color.fromRGBO(170, 163, 163, 0.247),
                blurRadius: 4,
                spreadRadius: 5,
                offset: Offset(0, 4),
              ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Image.asset(image, width: 135, height: 80),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            SizedBox(height: 5),
            RatingWidget(onTap: () {}, rating: rating),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
