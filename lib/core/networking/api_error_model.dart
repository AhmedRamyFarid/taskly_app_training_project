import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? code;

  @JsonKey(name: 'error_code')
  final String? error;

  @JsonKey(name: 'msg')
  final String? message;

  ApiErrorModel({required this.message, this.code, this.error});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
