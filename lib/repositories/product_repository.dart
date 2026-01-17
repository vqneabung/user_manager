import 'package:injectable/injectable.dart';
import 'package:user_manager/domain/dtos/request/common/common_product_request.dart';
import 'package:user_manager/domain/dtos/response/base_response.dart';
import 'package:user_manager/domain/dtos/response/common/product_response.dart';
import 'package:user_manager/network/store/product_client.dart';
import 'package:user_manager/utils/error_handle.dart';

abstract class ProductRepository {
    Future<BaseResponse<List<ProductResponse>>> getProducts();

    Future<BaseResponse<ProductResponse>> getProductById(String id);

    Future<BaseResponse<String>> createProduct(CommonProductRequest productRequest);

    Future<BaseResponse<String>> updateProduct(String id, CommonProductRequest productRequest);

    Future<BaseResponse<String>> deleteProduct(String id);
}

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
    final ProductClient productClient;

    ProductRepositoryImpl({required this.productClient});

    @override
    Future<BaseResponse<String>> createProduct(CommonProductRequest productRequest) async {
        return await ErrorHandle.handleAsync(() async {
            var result = await productClient.createProduct(productRequest);
            return result;
        });
    }

    @override
    Future<BaseResponse<String>> deleteProduct(String id) async {
        return await ErrorHandle.handleAsync(() async {
            var result = await productClient.deleteProduct(id);
            return result;
        });
    }

    @override
    Future<BaseResponse<List<ProductResponse>>> getProducts() async {
        return await ErrorHandle.handleAsync(() async {
            var result = await productClient.getProducts();
            return result;
        });
    }

    @override
    Future<BaseResponse<ProductResponse>> getProductById(String id) async {
        return await ErrorHandle.handleAsync(() async {
            var result = await productClient.getProductById(id);
            return result;
        });
    }

    @override
    Future<BaseResponse<String>> updateProduct(String id, CommonProductRequest productRequest) async {
        return await ErrorHandle.handleAsync(() async {
            var result = await productClient.updateProduct(id, productRequest);
            return result;
        });
    }
}