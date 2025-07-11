import 'dart:developer';
import 'package:eat_fun/screen/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    Future<void> logIn({
      required String email,
      required String password,
    }) async {
      try {
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user != null) {
            log(credential.user!.email!);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder:
                    (context) => ProfilePage(
                      email: credential.user!.email!,
                      password: password,
                    ),
              ),
              (route) => false,
            );
          } else {
            log("мындай аккаут жок");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      } catch (e) {
        log(e.toString());
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailCtrl,
            decoration: const InputDecoration(labelText: 'Email or Username'),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Please enter your email or username'
                        : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordCtrl,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Please enter your password'
                        : null,
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Forgot password?",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await logIn(email: emailCtrl.text, password: passwordCtrl.text);
              }
              emailCtrl.clear();
              passwordCtrl.clear();
            },
            child: const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
