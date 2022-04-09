import 'package:json_annotation/json_annotation.dart';
import 'package:quantum_proj/data/models/base_models/base_model.dart';

part 'auth_res_model.g.dart';

@JsonSerializable()
class AuthResponse extends BaseModel {
  final int? id;
  final String? email;
  final String? token;
  final String? name;
  final String? message;

  AuthResponse({this.id, this.email, this.token, this.name,this.message});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return AuthResponse.fromJson(json);
  }
}
