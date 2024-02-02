import 'package:assessment/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductStates extends Equatable {
  const ProductStates();
  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductStates {}

class ProductLoading extends ProductStates {
  const ProductLoading();
}

class ProductLoaded extends ProductStates {
  final List<ProductModel> ProductList;
  const ProductLoaded({required this.ProductList});
}

class ProductError extends ProductStates {
  final String? error;
  const ProductError({required this.error});
}
