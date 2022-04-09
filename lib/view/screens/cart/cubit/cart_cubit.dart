import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quantum_proj/data/models/cart_model/cart_item.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;
  CartCubit() : super(CartInitial());

  void addToCart(Product product) {
    if (_cartItems.any((item) => item.product.id == product.id)) {
      _cartItems.firstWhere((item) => item.product.id == product.id).increment();
      emit(AddItemState(time: DateTime.now()));
    } else {
      _cartItems.add(CartItem(product));
    }

    
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
    emit(RemovedItemState(time: DateTime.now()));
  }
}
