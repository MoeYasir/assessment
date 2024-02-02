import 'package:assessment/bloc/prodct_state.dart';
import 'package:assessment/bloc/product_event.dart';
import 'package:assessment/model/product_model.dart';
import 'package:assessment/resources/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStates> {
  ProductBloc() : super(ProductInitialState()) {
    final ApiRepository apiRepository = ApiRepository();

    on((event, emit) async {
      try {
        emit(ProductLoading());
        final List<ProductModel> ProductsList =
            await apiRepository.fetchProductList();

        emit(ProductLoaded(ProductList: ProductsList));
        if (ProductsList[0].error != null) {
          emit(ProductError(error: ProductsList[0].error));
        }
      } on NetworkError {
        emit(const ProductError(
            error: "Error fetching data, are you connected ?"));
      }
    });
  }
}
