import 'package:eat_fun/widgets/login_card.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  List<bool> isSelected = [true, false];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: Stack(
          children: [
            Image.asset('assets/images/Ellipse 1.png'),
            Image.asset('assets/images/fastFood.png'),
            Image.asset('assets/images/Ellipse 2.png'),
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 151,
              ),
            ),
            Positioned(top: 170, child: LoginCard()),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/bigPizza.png',
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                'assets/images/hamburger.png',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
