import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/login_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';
import 'package:user_manager/network/auth/auth_client.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthClient authClient;

  AuthRepositoryImpl({required this.authClient});

  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      return await authClient.login(loginRequest);
    } catch (e) {
      return BaseResponse(success: false, errors: e.toString(), data: null);
    }
  }
}
