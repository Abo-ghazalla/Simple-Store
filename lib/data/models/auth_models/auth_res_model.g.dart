// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      id: json['id'] as int?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      name: json['name'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
      'name': instance.name,
      'message': instance.message,
    };
