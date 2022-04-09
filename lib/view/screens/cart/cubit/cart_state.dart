part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  final DateTime? t;
  const CartState({this.t});

  @override
  List<Object?> get props => [t];
}

class CartInitial extends CartState {}
class RemovedItemState extends CartState {
  final DateTime? time;
  const RemovedItemState({this.time}) : super(t: time);
}
class AddItemState extends CartState {
  final DateTime? time;
  const AddItemState({this.time}) : super(t: time);
}
