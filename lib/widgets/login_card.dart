import 'package:flutter/material.dart';
import 'login_form.dart';
import 'sugnUp_form.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool isLogin = true;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 475,
      width: 316,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: const Color(0xCC766F6F)),
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: [isLogin, !isLogin],
              onPressed: (index) {
                setState(() => isLogin = index == 0);
              },
              borderColor: Color(0xFFBE0127),
              focusColor: Color(0xFFBE0127),
              fillColor: Color(0xFFBE0127),
              selectedBorderColor: Color(0xFFBE0127),
              selectedColor: Color(0xFFBE0127),
              color: Color(0xFFF8E0A0),
              borderRadius: BorderRadius.all(Radius.circular(17)),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 3,
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontFamily: 'Rosario',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Color(0xFFBE0127),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29, vertical: 3),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: 'Rosario',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Color(0xFFBE0127),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isLogin ? const LoginForm() : const RegisterForm(),
            SizedBox(height: 5),
            Text(
              "OR",
              style: TextStyle(
                fontFamily: 'Rosario',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xCC766F6F),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/google.png'),
                ),
                SizedBox(width: 18),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/facebook.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
