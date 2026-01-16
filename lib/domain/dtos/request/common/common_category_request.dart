import 'package:json_annotation/json_annotation.dart';

part 'common_category_request.g.dart';

@JsonSerializable()
class CommonCategoryRequest {
    String? name;

    CommonCategoryRequest({required this.name});

    factory CommonCategoryRequest.fromJson(Map<String, dynamic> json) => _$CommonCategoryRequestFromJson(json);

    Map<String, dynamic> toJson() => _$CommonCategoryRequestToJson(this);

}