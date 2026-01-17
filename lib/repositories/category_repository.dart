import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/common/common_category_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/category_response.dart';
import 'package:user_manager/network/store/category_client.dart';
import 'package:user_manager/utils/error_handle.dart';

abstract class CategoryRepository {
  Future<BaseResponse<List<CategoryResponse>>> getCategories();
  Future<BaseResponse<CategoryResponse>> getCategoryById(String id);
  Future<BaseResponse<String>> createCategory(
    CommonCategoryRequest categoryRequest,
  );
  Future<BaseResponse<String>> deleteCategory(String id);
}

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryClient categoryClient;

  CategoryRepositoryImpl({required this.categoryClient});

  @override
  Future<BaseResponse<String>> createCategory(
    CommonCategoryRequest categoryRequest,
  ) async {
    return await ErrorHandle.handleAsync(() async {
      var result = await categoryClient.createCategory(categoryRequest);
      return result;
    });
  }

  @override
  Future<BaseResponse<String>> deleteCategory(String id) async {
    return await ErrorHandle.handleAsync(() async {
      var result = await categoryClient.deleteCategory(id);
      return result;
    });
  }

  @override
  Future<BaseResponse<List<CategoryResponse>>> getCategories() async {
    return await ErrorHandle.handleAsync(() async {
      var result = await categoryClient.getCategories();
      return result;
    });
  }

  @override
  Future<BaseResponse<CategoryResponse>> getCategoryById(String id) async {  
    return await ErrorHandle.handleAsync(() async {
      var result = await categoryClient.getCategoryById(id);
      return result;
    });
  }
}
