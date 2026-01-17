import 'package:user_manager/domain/dtos/request/order/create_order_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/order_response.dart';
import 'package:user_manager/repositories/unit_of_work.dart';

abstract class OrderService {
  Future<BaseResponse<List<OrderResponse>>> getOrders();
  Future<BaseResponse<OrderResponse>> getOrderById(String id);
  Future<BaseResponse<String>> createOrder(CreateOrderRequest orderRequest);
  Future<BaseResponse<String>> deleteOrder(String id);
}

class OrderServiceImpl implements OrderService {
  final UnitOfWork unitOfWork;
  
  OrderServiceImpl({required this.unitOfWork});

  @override
  Future<BaseResponse<String>> createOrder(
      CreateOrderRequest orderRequest) async {
    var result =
        await unitOfWork.orderRepository.createOrder(orderRequest);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Order Created Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<String>> deleteOrder(String id) async {
    var result = await unitOfWork.orderRepository.deleteOrder(id);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Order Deleted Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<OrderResponse>> getOrderById(String id) async {
    var result = await unitOfWork.orderRepository.getOrderById(id);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Order Retrieved Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<List<OrderResponse>>> getOrders() async {
    var result = await unitOfWork.orderRepository.getOrders();
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Orders Retrieved Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }
}