
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';

part 'auth_client.g.dart';

@RestApi(baseUrl: "http://localhost:5117/api/auth/")
abstract class AuthClient{
    factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

    @POST('/login')
    Future<BaseResponse<LoginResponse>> loginResponse();
    
}