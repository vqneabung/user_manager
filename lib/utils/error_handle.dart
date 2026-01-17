import 'package:user_manager/domain/dtos/response/base_response.dart';

class ErrorHandle {
  // Without async with base response
  static BaseResponse<T>? handle<T>(BaseResponse<T> Function() func) {
    try {
      return func();
    } catch (e) {
      return BaseResponse<T>(success: false, errors: e.toString(), data: null);
    }
  }

  // With async with base response
  static Future<BaseResponse<T>> handleAsync<T>(Future<BaseResponse<T>> Function() func) async {
    try {
      return await func();
    } catch (e) {
      return BaseResponse<T>(success: false, errors: e.toString(), data: null);
    }
  }
}
