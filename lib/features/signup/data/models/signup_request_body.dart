import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable(createFactory: false)
class SignUpRequestBody {
  final String email;
  final String password;

  @JsonKey(name: 'data')
  final SignUpUserData userData;

  const SignUpRequestBody({
    required this.email,
    required this.password,
    required this.userData,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}

@JsonSerializable(createFactory: false)
class SignUpUserData {
  final String name;

  @JsonKey(name: 'department')
  final String? jobTitle;

  const SignUpUserData({required this.name, this.jobTitle});

  Map<String, dynamic> toJson() => _$SignUpUserDataToJson(this);
}
