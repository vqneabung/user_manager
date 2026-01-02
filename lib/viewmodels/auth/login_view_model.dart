import 'package:flutter/foundation.dart';
import 'package:user_manager/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier{
    final AuthService authService;

    LoginViewModel({required this.authService});



}