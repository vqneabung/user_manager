import 'package:json_annotation/json_annotation.dart';
import 'package:user_manager/domain/dtos/response/common/common_base_response.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends CommonBaseResponse {
  String? urlImage;
  String? name;
  String? categoryId;
  String? description;
  double? price;
  int? stockQuantity;

  ProductResponse({
    required this.urlImage,
    required this.name,
    required this.categoryId,
    required this.description,
    required this.price,
    required this.stockQuantity,
    super.id,
    super.createdAt,
    super.updatedAt,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
