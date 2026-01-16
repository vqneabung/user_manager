import 'package:json_annotation/json_annotation.dart';

part 'common_order_detail_request.g.dart';

@JsonSerializable()
class CommonOrderDetailRequest {
  String? productId;
  int? quantity;

  CommonOrderDetailRequest({required this.productId, required this.quantity});

  factory CommonOrderDetailRequest.fromJson(Map<String, dynamic> json) => _$CommonOrderDetailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CommonOrderDetailRequestToJson(this);
}
