import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_event.dart';

import '../infrastructure/repository.dart';
import 'product_state.dart';

class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {
  Repository repository;
  ProductPageBloc(this.repository) : super(const ProductPageInitialState()) {
    on<GenerateFakeProductsEvent>((event, emit) async {
      if (kDebugMode) {
        print("here");
      }
      await repository.generateFakeProducts();
      emit(const ProductPageInitialState());
    });
  }
}
