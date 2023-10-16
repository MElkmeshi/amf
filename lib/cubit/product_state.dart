part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> product;

  ProductLoaded(this.product);
}

class ProductDeleted extends ProductState {}

class ProductUpdated extends ProductState {}

class ProductAdded extends ProductState {}
