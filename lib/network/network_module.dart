import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:user_manager/constaints/api_constants.dart';
import 'package:user_manager/network/auth/auth_client.dart';
import 'package:user_manager/network/store/category_client.dart';
import 'package:user_manager/network/store/order_client.dart';
import 'package:user_manager/network/store/product_client.dart';
import 'package:user_manager/utils/url.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() {
    return Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  @lazySingleton
  AuthClient authClient(Dio dio) {
    return AuthClient(dio, baseUrl: ApiConstants.authBaseUrl);
  }

  @lazySingleton
  CategoryClient categoryClient(Dio dio) {
    return CategoryClient(dio, baseUrl: Url.storeUrl('categories'));
  }

  @lazySingleton
  OrderClient orderClient(Dio dio) {
    return OrderClient(dio, baseUrl: Url.storeUrl('orders'));
  }

  @lazySingleton
  ProductClient productClient(Dio dio) {
    return ProductClient(dio, baseUrl: Url.storeUrl('products'));
  }
}

