import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';

class CartItem {
  int _count = 1;
  final Product product;

  CartItem(this.product);

  void increment() {
    _count = _count + 1;
  }

  int get count => _count;
}
