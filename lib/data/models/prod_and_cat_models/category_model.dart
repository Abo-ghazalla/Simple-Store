import 'package:json_annotation/json_annotation.dart';
import 'package:quantum_proj/data/models/base_models/base_model.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';

part 'category_model.g.dart';


@JsonSerializable(explicitToJson: true)
class CategoryModel extends BaseModel {
  final int? id;
  final String? title;
  final List<Product>? products;

  CategoryModel({this.id, this.title,this.products});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromJson(json);
  }
}
