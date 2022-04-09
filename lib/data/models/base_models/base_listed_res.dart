import 'package:quantum_proj/data/models/base_models/base_model.dart';

class BaseListedResponse<T extends BaseModel> {
  final List<T> data;
  BaseListedResponse({
    required this.data,
  });

  factory BaseListedResponse.fromJson(json, BaseModel model) =>
      BaseListedResponse(
        data: json == null
            ? []
            : List<T>.from((json as List<dynamic>)
                .map((x) => model.fromJson(x as Map<String, dynamic>))),
      );

  Map<String, dynamic> toMap() => {
        "data": data.map((e) => e.toJson()).toList(),
      };
}
