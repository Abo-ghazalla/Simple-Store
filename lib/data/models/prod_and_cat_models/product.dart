import 'package:json_annotation/json_annotation.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/category_model.dart';

import '../base_models/base_model.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product extends BaseModel {
  final int? id;
  final String? title;
  final double? price;
  final bool? active;
  final int? stock;
  final List<CategoryModel>? categories;

  Product(
      {this.id,
      this.title,
      this.price,
      this.active,
      this.stock,
      this.categories});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return Product.fromJson(json);
  }
}
