// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      expiresAt: (json['expires_at'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  metadata: UserMetadata.fromJson(
    json['user_metadata'] as Map<String, dynamic>,
  ),
);

UserMetadata _$UserMetadataFromJson(Map<String, dynamic> json) => UserMetadata(
  name: json['name'] as String,
  department: json['department'] as String,
);
