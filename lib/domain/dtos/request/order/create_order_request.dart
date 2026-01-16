import 'package:json_annotation/json_annotation.dart';
import 'package:user_manager/domain/dtos/request/common/common_order_detail_request.dart';
import 'package:user_manager/domain/dtos/request/common/common_order_request.dart';

part 'create_order_request.g.dart';

@JsonSerializable()
class CreateOrderRequest extends CommonOrderRequest {
  List<CommonOrderDetailRequest>? orderDetails;

  CreateOrderRequest({required super.customerId, required super.status});

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);
}
