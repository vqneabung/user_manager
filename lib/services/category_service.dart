import 'package:user_manager/domain/dtos/request/common/common_category_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/category_response.dart';
import 'package:user_manager/repositories/unit_of_work.dart';

abstract class CategoryService {
  Future<BaseResponse<List<CategoryResponse>>> getCategories();
  Future<BaseResponse<CategoryResponse>> getCategoryById(String id);
  Future<BaseResponse<String>> createCategory(
    CommonCategoryRequest categoryRequest,
  );
  Future<BaseResponse<String>> deleteCategory(String id);
}

class CategoryServiceImpl implements CategoryService {
  final UnitOfWork unitOfWork;

  CategoryServiceImpl({required this.unitOfWork});

  @override
  Future<BaseResponse<String>> createCategory(
    CommonCategoryRequest categoryRequest,
  ) async {
    var result = await unitOfWork.categoryRepository.createCategory(categoryRequest);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Category Created Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<String>> deleteCategory(String id) async {
    var result = await unitOfWork.categoryRepository.deleteCategory(id);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Category Deleted Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<List<CategoryResponse>>> getCategories() async {
    var result = await unitOfWork.categoryRepository.getCategories();
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Categories Retrieved Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<CategoryResponse>> getCategoryById(String id) async {
    var result = await unitOfWork.categoryRepository.getCategoryById(id);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Category Retrieved Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }
}