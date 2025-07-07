import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator:
                (value) =>
                    value == null || value.isEmpty
                        ? 'Please enter email'
                        : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
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
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // регистрация логикасы
              }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
