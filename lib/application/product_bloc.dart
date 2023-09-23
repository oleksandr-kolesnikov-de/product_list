import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_event.dart';
import 'package:product_list/domain/i_repository.dart';

import '../domain/product.dart';
import 'product_state.dart';

class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {
  IRepository repository;
  ProductPageBloc(this.repository) : super(ProductPageInitialState.emptyState()) {
    on<GenerateFakeProductsEvent>((event, emit) async {
      if (kDebugMode) {
        print("Generating product list...");
      }
      List<Product> newList = await repository.generateFakeProducts();;
      emit(ProductPageInitialState(newList));
    });
  }
}
