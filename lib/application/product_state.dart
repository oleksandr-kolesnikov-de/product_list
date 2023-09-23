import 'package:equatable/equatable.dart';

import '../domain/product.dart';

abstract class ProductPageState extends Equatable {
  List<Product> list;
  ProductPageState(this.list);

  @override
  List<Object> get props => [list];
}

class ProductPageInitialState extends ProductPageState {
  ProductPageInitialState(super.list);

  factory ProductPageInitialState.emptyState() {
    return ProductPageInitialState(const []);
  }
}