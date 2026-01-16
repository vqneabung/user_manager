import 'package:json_annotation/json_annotation.dart';
import 'package:user_manager/domain/dtos/response/common/common_base_response.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends CommonBaseResponse {
  String? name;
  CategoryResponse({required this.name, super.id, super.createdAt, super.updatedAt});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);
}