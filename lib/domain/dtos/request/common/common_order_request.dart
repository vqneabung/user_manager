import 'package:json_annotation/json_annotation.dart';

part 'common_order_request.g.dart';

@JsonSerializable()
class CommonOrderRequest {
    String? customerId;
    int? status;

    CommonOrderRequest({required this.customerId, required this.status});

    factory CommonOrderRequest.fromJson(Map<String, dynamic> json) => _$CommonOrderRequestFromJson(json);
    Map<String, dynamic> toJson() => _$CommonOrderRequestToJson(this);
}