import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/login_request.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';
import 'package:user_manager/services/auth_service.dart';
import 'package:user_manager/viewmodels/state/load_data_state.dart';

@injectable
class LoginViewModel extends Cubit<LoadDataState<LoginResponse>> {
  final AuthService authService;
  LoginViewModel(this.authService) : super(const LoadDataState.initial());

  // bool _loginLoading = false;

  // bool get loginLoading => _loginLoading;

  // void setLoginLoading(bool value) {
  //   _loginLoading = value;
  //   notifyListeners();
  // }

  Future<void> login(LoginRequest loginRequest, BuildContext context) async {
    // setLoginLoading(true);
    emit(const LoadDataState.loading());
    var result = await authService.login(loginRequest);
    if (result.success == true) {
      if (context.mounted) {
        emit(LoadDataState.success(data: null));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Successfully!")));
      }
    } else {
      if (context.mounted) {
        emit(LoadDataState.error(error: ""));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Login Failed!")));
      }
    }
    // setLoginLoading(false);
  }
}
