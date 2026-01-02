import 'package:flutter/material.dart';
import 'package:user_manager/domain/dtos/request/login_request.dart';
import 'package:user_manager/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService authService;

  LoginViewModel({required this.authService});

  bool _loginLoading = false;

  bool get loginLoading => _loginLoading;

  void setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  Future<void> login(LoginRequest loginRequest, BuildContext context) async {
    setLoginLoading(true);
    var result = await authService.login(loginRequest);
    if (result.success == true) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Successfully!")));
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Failed!")));
      }
    }
    setLoginLoading(false);
  }
}
