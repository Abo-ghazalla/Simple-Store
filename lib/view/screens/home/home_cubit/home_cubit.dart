import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/product.dart';
import 'package:quantum_proj/data/repos/imports.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(LoadingAllProducts());

  Future<void> getProducts() async {
    emit(LoadingAllProducts());
    final res = await getProduct();
    res.fold(
      (products) {
        emit(LoadedAllProducts(products));
      },
      (failure) => emit(HomeError(failure.msg)),
    );
  }
}
