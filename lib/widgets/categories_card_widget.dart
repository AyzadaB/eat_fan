import 'package:flutter/material.dart';

class CategoriesCardWidget extends StatelessWidget {
  const CategoriesCardWidget({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.label,
  });

  final bool isSelected;
  final String iconPath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: isSelected ? 10 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // <-- вот здесь радиус
            side: BorderSide(
              color:
                  isSelected
                      ? Color.fromARGB(255, 208, 103, 124)
                      : Colors.transparent, // рамка если нужно
              width: 1,
            ),
          ),
          color: Color(0xFFECE5E5),
          shadowColor: Color.fromARGB(255, 243, 4, 52),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 18),
            child: Image.asset(iconPath, width: 33, height: 33),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Color(0xFFBE0127) : Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
