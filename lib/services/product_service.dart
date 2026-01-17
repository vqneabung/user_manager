import 'package:user_manager/domain/dtos/request/common/common_product_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/product_response.dart';
import 'package:user_manager/repositories/unit_of_work.dart';

abstract class ProductService {
  Future<BaseResponse<List<ProductResponse>>> getProducts();
  Future<BaseResponse<ProductResponse>> getProductById(String id);
  Future<BaseResponse<String>> createProduct(
    CommonProductRequest productRequest,
  );
  Future<BaseResponse<String>> updateProduct(
    String id,
    CommonProductRequest productRequest,
  );
  Future<BaseResponse<String>> deleteProduct(String id);
}

class ProductServiceImpl implements ProductService {
  final UnitOfWork unitOfWork;

  ProductServiceImpl({required this.unitOfWork});

  @override
  Future<BaseResponse<String>> createProduct(
    CommonProductRequest productRequest,
  ) async {
    var result = await unitOfWork.productRepository.createProduct(
      productRequest,
    );
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Product Created Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<String>> deleteProduct(String id) async {
    var result = await unitOfWork.productRepository.deleteProduct(id);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Product Deleted Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<List<ProductResponse>>> getProducts() async {
    var result = await unitOfWork.productRepository.getProducts();
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Products Retrieved Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<ProductResponse>> getProductById(String id) async {
    var result = await unitOfWork.productRepository.getProductById(id);
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Product Retrieved Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }

  @override
  Future<BaseResponse<String>> updateProduct(
    String id,
    CommonProductRequest productRequest,
  ) async {
    var result = await unitOfWork.productRepository.updateProduct(
      id,
      productRequest,
    );
    if (result.success == true) {
      return BaseResponse(
        success: true,
        errors: "Product Updated Successfully!",
        data: result.data,
      );
    } else {
      return BaseResponse(success: false, errors: result.errors, data: null);
    }
  }
}
