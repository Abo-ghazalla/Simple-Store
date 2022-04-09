import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/view/screens/cart/cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(12),
          child: cart.cartItems.isEmpty
              ? const Center(child: Text('Cart is empty'))
              : ListView.separated(
                  itemBuilder: (_, i) => ListTile(
                    title: Text(cart.cartItems[i].product.title!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price: " +
                              cart.cartItems[i].product.price!.toString(),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "count: " + cart.cartItems[i].count.toString(),
                        )
                      ],
                    ),
                    trailing: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              cart.removeFromCart(cart.cartItems[i].product),
                        ),
                        IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      onPressed: () =>
                          cart.addToCart(cart.cartItems[i].product),
                    )
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                  separatorBuilder: (_, i) => const Divider(),
                  itemCount: cart.cartItems.length,
                )),
    );
  }
}
