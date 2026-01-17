import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:user_manager/domain/dtos/request/order/create_order_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/order_response.dart';

part 'order_client.g.dart';

@RestApi()
abstract class OrderClient {
    factory OrderClient(Dio dio, {String baseUrl}) = _OrderClient;
    
    @GET("/")
    Future<BaseResponse<List<OrderResponse>>> getOrders();

    @GET("/{id}")
    Future<BaseResponse<OrderResponse>> getOrderById(@Path("id") String id);

    @POST("/")
    Future<BaseResponse<String>> createOrder(@Body() CreateOrderRequest orderRequest);

    @DELETE("/{id}")
    Future<BaseResponse<String>> deleteOrder(@Path("id") String id);
}