import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:user_manager/domain/dtos/request/common/common_category_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/category_response.dart';

part 'category_client.g.dart';

@RestApi()
abstract class CategoryClient {
  factory CategoryClient(Dio dio, {String baseUrl}) = _CategoryClient;

  @GET("/")
  Future<BaseResponse<List<CategoryResponse>>> getCategories();

  @GET("/{id}")
  Future<BaseResponse<CategoryResponse>> getCategoryById(@Path("id") String id);

  @POST("/")
  Future<BaseResponse<String>> createCategory(
    @Body() CommonCategoryRequest categoryRequest,
  );

  @DELETE("/{id}")
  Future<BaseResponse<String>> deleteCategory(@Path("id") String id);
}
  