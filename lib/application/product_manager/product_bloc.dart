import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_manager/product_event.dart';
import 'package:product_list/domain/core/use_case.dart';
import 'package:product_list/domain/product_manager/usecase/generate_fake_products.dart';
import 'package:product_list/domain/product_manager/entity/product.dart';
import 'package:product_list/domain/product_manager/usecase/search_products.dart';
import 'package:product_list/domain/product_manager/usecase/sort_asc_products.dart';
import 'package:product_list/domain/product_manager/usecase/sort_desc_products.dart';

import 'product_state.dart';

class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {
  GenerateFakeProducts generateFakeProducts;
  SearchProducts searchProducts;
  SortAscProducts sortAscProducts;
  SortDescProducts sortDescProducts;

  ProductPageBloc(this.generateFakeProducts, this.searchProducts,
      this.sortAscProducts, this.sortDescProducts)
      : super(ProductPageInitialState.emptyState()) {
    on<GenerateFakeProductsEvent>((event, emit) async {
      emit(
          ProductPageLoadingState(state.list, state.shownList, state.sortType));
      // just to extend the exercise
      // some error processing
      final eitherResult = await generateFakeProducts(NoParams());
      eitherResult.fold((l) {
        List<Product> newList = l;
        List<Product> newShownList = newList;
        emit(ProductPageLoadedState(newList, newShownList, state.sortType));
      }, (r) {
        emit(
            ProductPageErrorState(state.list, state.shownList, state.sortType));
      });
    });

    on<SearchProductsEvent>((event, emit) async {
      emit(ProductPageProcessingState(
          state.list, state.shownList, state.sortType));
      List<Product> newShownList =
          await searchProducts(SearchProductsParams(event.pattern, state.list));
      emit(ProductPageLoadedState(state.list, newShownList, SortType.no));
    });

    on<SortAscProductsEvent>((event, emit) async {
      emit(ProductPageProcessingState(
          state.list, state.shownList, state.sortType));
      List<Product> newShownList =
          await sortAscProducts(SortAscProductsParams(state.shownList));
      emit(ProductPageLoadedState(state.list, newShownList, SortType.asc));
    });

    on<SortDescProductsEvent>((event, emit) async {
      emit(ProductPageProcessingState(
          state.list, state.shownList, state.sortType));
      List<Product> newShownList =
          await sortDescProducts(SortDescProductsParams(state.shownList));
      emit(ProductPageLoadedState(state.list, newShownList, SortType.desc));
    });
  }
}
