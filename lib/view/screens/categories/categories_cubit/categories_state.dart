part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryModel> categories;
  const CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String msg;
  const CategoriesError(this.msg);
}
