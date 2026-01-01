import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/login_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';
import 'package:user_manager/network/auth/auth_client.dart';

abstract class AuthRepository {
  Future<BaseResponse<LoginResponse>> loginResponse(LoginRequest loginRequest);
}

@Injectable()
class AuthRepositoryImp implements AuthRepository {
  final AuthClient authClient;

  AuthRepositoryImp({required this.authClient});

  @override
  Future<BaseResponse<LoginResponse>> loginResponse(LoginRequest loginRequest) {
    return authClient.loginResponse();
  }
}
