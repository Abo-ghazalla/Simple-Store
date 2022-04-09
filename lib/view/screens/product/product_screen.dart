import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';
import 'package:quantum_proj/view/general_widgets/app_primarty_btn.dart';
import 'package:quantum_proj/view/screens/cart/cubit/cart_cubit.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title!),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 4),
              Text("price: ${product.price}"),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Categories",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    ...product.categories!.map((e) => Text(e.title!)).toList(),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text("stock: ${product.stock}"),
              const SizedBox(height: 4),
              Text(product.active! ? "active" : "inactive"),
              AppPrimaryButton(
                text: "Add to Cart",
                onPressed: () {
                  context.read<CartCubit>().addToCart(product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
