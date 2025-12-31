
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:user_manager/domain/dtos/response/login_response.dart';

part 'retrofit_client.g.dart';

@RestApi()
abstract class RetrofitClient {
    factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;
}