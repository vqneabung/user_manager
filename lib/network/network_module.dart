import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:user_manager/constaints/api_constants.dart';
import 'package:user_manager/network/auth/auth_client.dart';

@module
abstract class NetworkModule {

  @lazySingleton
  Dio dio(){
    return Dio();
  }

  @lazySingleton
  AuthClient authClient(Dio dio){
    return AuthClient(dio, baseUrl: ApiConstants.authBaseUrl);
  }

}