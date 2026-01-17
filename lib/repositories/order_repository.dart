import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/order/create_order_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/order_response.dart';
import 'package:user_manager/network/store/order_client.dart';
import 'package:user_manager/utils/error_handle.dart';

abstract class OrderRepository {
  Future<BaseResponse<List<OrderResponse>>> getOrders();
  Future<BaseResponse<OrderResponse>> getOrderById(String id);
  Future<BaseResponse<String>> createOrder(CreateOrderRequest orderRequest);
  Future<BaseResponse<String>> deleteOrder(String id);
}

@LazySingleton(as: OrderRepository)
class OrderRepositoryImpl implements OrderRepository {
  final OrderClient orderClient;

  OrderRepositoryImpl({required this.orderClient});

  @override
  Future<BaseResponse<String>> createOrder(
    CreateOrderRequest orderRequest,
  ) async {
    return await ErrorHandle.handleAsync(() async {
      var result = await orderClient.createOrder(orderRequest);
      return result;
    });
  }

  @override
  Future<BaseResponse<String>> deleteOrder(String id) async {
    return await ErrorHandle.handleAsync(() async {
      var result = await orderClient.deleteOrder(id);
      return result;
    });
  }

  @override
  Future<BaseResponse<OrderResponse>> getOrderById(String id) async {
    return await ErrorHandle.handleAsync(() async {
      var result = await orderClient.getOrderById(id);
      return result;
    });
  }

  @override
  Future<BaseResponse<List<OrderResponse>>> getOrders() async {
    return await ErrorHandle.handleAsync(() async {
      var result = await orderClient.getOrders();
      return result;
    });
  }
}
