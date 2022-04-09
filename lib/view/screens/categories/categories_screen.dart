import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quantum_proj/config/app_router/imports.dart';
import 'package:quantum_proj/utils/constants/resources.dart';
import 'package:quantum_proj/view/screens/categories/Categories_cubit/categories_cubit.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoriesCubit()..getAllCats(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: Builder(builder: (ctx) {
          return RefreshIndicator(
            onRefresh: () => ctx.read<CategoriesCubit>().getAllCats(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (_, state) {
                  if (state is CategoriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesLoaded) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: state.categories.length,
                            separatorBuilder: (_,__) => const Divider(),
                            itemBuilder: (_, i) => ListTile(
                              title: Text(state.categories[i].title!),
                              style: ListTileStyle.drawer,
                              tileColor: Colors.yellow.withOpacity(.3),
                              onTap: (){},
                              // onTap: () => AppRouter.push(
                              //   categoryProductsScreen,
                              //   arguments: state.categories[i].id,
                              // ),
                            ),
                          ),
                        ),
                      ],
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
