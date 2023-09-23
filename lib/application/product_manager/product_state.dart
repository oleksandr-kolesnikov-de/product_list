import 'package:equatable/equatable.dart';

import '../../domain/product_manager/product.dart';

abstract class ProductPageState extends Equatable {
  List<Product> list;
  List<Product> shownList;
  ProductPageState(this.list, this.shownList);

  @override
  List<Object> get props => [list, shownList];
}

class ProductPageInitialState extends ProductPageState {
  ProductPageInitialState(super.list, super.shownList);

  factory ProductPageInitialState.emptyState() {
    return ProductPageInitialState(const [], const []);
  }
}

class ProductPageLoadingState extends ProductPageState {
  ProductPageLoadingState(super.list, super.shownList);

}

class ProductPageProcessingState extends ProductPageState {
  ProductPageProcessingState(super.list, super.shownList);

}

class ProductPageLoadedState extends ProductPageState {
  ProductPageLoadedState(super.list, super.shownList);

}

class ProductPageErrorState extends ProductPageState {
  ProductPageErrorState(super.list, super.shownList);

}