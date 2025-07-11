import 'dart:developer';
import 'package:eat_fun/screen/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();

    Future<void> register({
      required String email,
      required String password,
    }) async {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (credential.user != null) {
          log(credential.user!.toString());
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
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailCtrl,
            decoration: const InputDecoration(labelText: 'Email'),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Please enter email'
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
                        ? 'Please enter password'
                        : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordCtrl,
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Please confirm password'
                        : null,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await register(
                  email: emailCtrl.text,
                  password: passwordCtrl.text,
                );
                emailCtrl.clear();
                passwordCtrl.clear();
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
