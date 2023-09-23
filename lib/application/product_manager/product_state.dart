import 'package:equatable/equatable.dart';

import '../../domain/product_manager/product.dart';

enum SortType { no, asc, desc }

abstract class ProductPageState extends Equatable {
  List<Product> list;
  List<Product> shownList;
  SortType sortType;

  ProductPageState(this.list, this.shownList, this.sortType);

  @override
  List<Object> get props => [list, shownList, sortType];
}

class ProductPageInitialState extends ProductPageState {
  ProductPageInitialState(super.list, super.shownList, super.sortType);

  factory ProductPageInitialState.emptyState() {
    return ProductPageInitialState(const [], const [], SortType.no);
  }
}

class ProductPageLoadingState extends ProductPageState {
  ProductPageLoadingState(super.list, super.shownList, super.sortType);
}

class ProductPageProcessingState extends ProductPageState {
  ProductPageProcessingState(super.list, super.shownList, super.sortType);
}

class ProductPageLoadedState extends ProductPageState {
  ProductPageLoadedState(super.list, super.shownList, super.sortType);
}

class ProductPageErrorState extends ProductPageState {
  ProductPageErrorState(super.list, super.shownList, super.sortType);
}
