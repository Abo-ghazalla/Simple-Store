import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:quantum_proj/config/app_router/routes_name.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';
import 'package:quantum_proj/view/general_widgets/app_primarty_btn.dart';
import 'package:quantum_proj/view/screens/cart/cubit/cart_cubit.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          AppRouter.push(productScreen, arguments: product);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${product.title}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text("price: ${product.price}"),
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
