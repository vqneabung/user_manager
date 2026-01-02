import 'package:user_manager/domain/dtos/request/login_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';
import 'package:user_manager/repositories/auth_repository.dart';

abstract class AuthService {
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest);
}

class AuthServiceImpl implements AuthService {
  final AuthRepository authRepository;

  AuthServiceImpl({required this.authRepository});

  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    var result = await authRepository.login(loginRequest);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Login Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: true, errors: "Login Failed!", data: null);
    }
  }
}
