import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/utils/constants/resources.dart';
import 'package:quantum_proj/view/screens/home/home_cubit/home_cubit.dart';
import 'package:quantum_proj/view/screens/home/widget/app_drawer.dart';
import 'package:quantum_proj/view/screens/home/widget/prodcut_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Store'),
        ),
        drawer: const AppDrawer(),
        body: Builder(builder: (ctx) {
          return RefreshIndicator(
            onRefresh: () => ctx.read<HomeCubit>().getProducts(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is LoadingAllProducts) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedAllProducts) {
                    return GridView.builder(
                      itemCount: state.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3/4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (_, i) => ProductWidget(product: state.products[i]) ,
                    );
                  } else {
                    return const Center(child: Text(normalErrorMsg));
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
