import 'package:json_annotation/json_annotation.dart';
import 'package:user_manager/domain/dtos/response/common/common_base_response.dart';

part 'order_detail_response.g.dart';

@JsonSerializable()
class OrderDetailResponse extends CommonBaseResponse{
  String? productId;
  int? quantity;

  OrderDetailResponse({required this.productId, required this.quantity, super.id, super.createdAt, super.updatedAt});

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) => _$OrderDetailResponseFromJson(json);
}