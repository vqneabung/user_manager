import 'package:json_annotation/json_annotation.dart';
import 'package:user_manager/domain/dtos/response/common/common_base_response.dart';
import 'package:user_manager/domain/dtos/response/common/order_detail_response.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse extends CommonBaseResponse {
  String? customerId;
  int? status;
  List<OrderDetailResponse>? orderDetails;

  OrderResponse({
    required this.customerId,
    required this.status,
    this.orderDetails,
    super.id,
    super.createdAt,
    super.updatedAt,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
}
