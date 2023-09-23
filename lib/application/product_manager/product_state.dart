import 'package:equatable/equatable.dart';

import '../../domain/product_manager/entity/product.dart';

enum SortType { no, asc, desc }

abstract class ProductPageState extends Equatable {
  final List<Product> list;
  final List<Product> shownList;
  final SortType sortType;

  const ProductPageState(this.list, this.shownList, this.sortType);

  @override
  List<Object> get props => [list, shownList, sortType];
}

class ProductPageInitialState extends ProductPageState {
  const ProductPageInitialState(super.list, super.shownList, super.sortType);

  factory ProductPageInitialState.emptyState() {
    return const ProductPageInitialState([], [], SortType.no);
  }
}

class ProductPageLoadingState extends ProductPageState {
  const ProductPageLoadingState(super.list, super.shownList, super.sortType);
}

class ProductPageProcessingState extends ProductPageState {
  const ProductPageProcessingState(super.list, super.shownList, super.sortType);
}

class ProductPageLoadedState extends ProductPageState {
  const ProductPageLoadedState(super.list, super.shownList, super.sortType);
}

class ProductPageErrorState extends ProductPageState {
  const ProductPageErrorState(super.list, super.shownList, super.sortType);
}
