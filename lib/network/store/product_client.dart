import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:user_manager/domain/dtos/request/common/common_product_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/product_response.dart';

part 'product_client.g.dart';

@RestApi()
abstract class ProductClient {
    factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;
    
    @GET("/")
    Future<BaseResponse<List<ProductResponse>>> getProducts();

    @GET("/{id}")
    Future<BaseResponse<ProductResponse>> getProductById(@Path("id") String id);

    @POST("/")
    Future<BaseResponse<String>> createProduct(@Body() CommonProductRequest productRequest);

    @PUT("/{id}")
    Future<BaseResponse<String>> updateProduct(@Path("id") String id, @Body() CommonProductRequest productRequest);

    @DELETE("/{id}")
    Future<BaseResponse<String>> deleteProduct(@Path("id") String id);
}