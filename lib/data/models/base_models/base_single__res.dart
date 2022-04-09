import 'package:quantum_proj/data/models/base_models/base_model.dart';

class BaseSingleResponse<T extends BaseModel> {
  final T? data;

  BaseSingleResponse({
    this.data,
  });

  factory BaseSingleResponse.fromJson(
          Map<String, dynamic>? json, BaseModel? model) =>
      BaseSingleResponse(
        data: json == null ? null : model?.fromJson(json) as T,
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toJson(),
      };
}
