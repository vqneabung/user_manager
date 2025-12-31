
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
    bool? success;
    String? errors;
    T? data;

    BaseResponse({required this.success, required this.errors, required this.data});

    factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT,) => _$BaseResponseFromJson(json, fromJsonT);
}