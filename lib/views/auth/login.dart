import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email!';
                }
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password!';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login Successfully!")),
                ),
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
