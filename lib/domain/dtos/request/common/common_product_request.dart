import 'package:json_annotation/json_annotation.dart';

part 'common_product_request.g.dart';

@JsonSerializable()
class CommonProductRequest {
  String? urlImage;
  String? name;
  String? categoryId;
  String? description;
  double? price;
  int? stockQuantity;

  CommonProductRequest(
      {required this.urlImage,
      required this.name,
      required this.categoryId,
      required this.description,
      required this.price,
      required this.stockQuantity});

  factory CommonProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CommonProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommonProductRequestToJson(this);
}