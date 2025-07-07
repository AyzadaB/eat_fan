import 'package:flutter/material.dart';

class ToggleButtonExample extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ToggleButtonExample({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(2, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onChanged(index),
          child: Container(
            height: 28,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffBE0127) : Color(0xFFF8E0A0),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(index == 0 ? 17 : 0),
                right: Radius.circular(index == 1 ? 17 : 0),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              index == 0 ? 'Log In' : 'Sign Up',
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xffBE0127),
                fontWeight: FontWeight.bold,
                fontFamily: 'Rosario',
              ),
            ),
          ),
        );
      }),
    );
  }
}
