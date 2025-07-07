import 'package:flutter/material.dart';

class MenuAndProfile extends StatelessWidget {
  const MenuAndProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu), iconSize: 34),
          CircleAvatar(
            child: Image.asset(
              'assets/images/avatar.png',
              width: 34,
              height: 34,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
