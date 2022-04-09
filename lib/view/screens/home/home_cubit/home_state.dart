part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class LoadingAllProducts extends HomeState {}

class LoadedAllProducts extends HomeState {
  final List<Product> products;
  const LoadedAllProducts(this.products);
}

class HomeError extends HomeState {
  final String msg;
  const HomeError(this.msg);
}
