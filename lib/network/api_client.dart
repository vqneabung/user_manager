
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:user_manager/constaints/api_constants.dart';
import 'package:user_manager/network/auth/auth_client.dart';

final dio = Dio();

@lazySingleton
class ApiClient {
    final authApi = AuthClient(dio, baseUrl: ApiConstants.authBaseUrl);
}