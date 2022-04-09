import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quantum_proj/data/models/prod_and_cat_models/category_model.dart';
import 'package:quantum_proj/data/repos/imports.dart' as data_repo;

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> getAllCats() async {
    emit(CategoriesLoading());
    final res = await data_repo.getCategories();
    res.fold(
      (cats) => emit(CategoriesLoaded(cats)),
      (failure) => emit(CategoriesError(failure.msg)),
    );
  }
}
