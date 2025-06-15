import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/Ellipse 1.png'),
          Image.asset('assets/images/fastFood.png'),
          Image.asset('assets/images/Ellipse 2.png'),
          Image.asset('assets/images/logo.png', width: 250, height: 151),
          Positioned(
            top: 200,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 434,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                color: Colors.red,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    ToggleButtons(
                      isSelected: isSelected,
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                      borderRadius: BorderRadius.circular(17),
                      fillColor: Color(0xffF8E0A0),
                      selectedColor: Color(0xffBE0127),

                      children: [
                        Text(
                          "Log In",
                          style: TextStyle(
                            fontFamily: 'Rosario',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            fontFamily: 'Rosario',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
