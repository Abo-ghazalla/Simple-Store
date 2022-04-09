import 'package:json_annotation/json_annotation.dart';
import 'package:quantum_proj/data/models/base_models/base_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User extends BaseModel {
  final int? id;
  final String? name;
  final String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
