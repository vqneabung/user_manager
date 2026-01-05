import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_manager/config/injection.dart';
import 'package:user_manager/domain/dtos/request/login_request.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';
import 'package:user_manager/viewmodels/auth/login_view_model.dart';
import 'package:user_manager/viewmodels/state/load_data_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocBuilder<LoginViewModel, LoadDataState<LoginResponse>>(
        builder: (context, state) {
          return loginPage(context, state);
        },
      ),
    );
  }

  Widget loginPage(BuildContext context, LoadDataState state) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Enter your email!",
                labelText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email!';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                hintText: "Enter your password!",
                labelText: "Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password!';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final loginRequest = LoginRequest(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    context.read<LoginViewModel>().login(loginRequest, context);
                  }
                },
                child: const Text("Submit"),
              ),
            ),
            state.maybeWhen(
              initial: () {
                return const SizedBox();
              },
              loading: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Loading...")));
                return const SizedBox();
              },
              success: (response) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login Successfully!")),
                );
                return const SizedBox();
              },
              error: (error) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Login Failed!")));
                return const SizedBox();
              },
              orElse: () => const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
