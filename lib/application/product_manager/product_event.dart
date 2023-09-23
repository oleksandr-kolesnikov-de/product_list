import 'package:equatable/equatable.dart';
import 'package:product_list/domain/product_manager/entity/product.dart';

abstract class ProductPageEvent extends Equatable {

  const ProductPageEvent();

  @override
  List<Object> get props => [];
}

class GenerateFakeProductsEvent extends ProductPageEvent {
  const GenerateFakeProductsEvent() : super();
}

class SearchProductsEvent extends ProductPageEvent {
  final String pattern;
  const SearchProductsEvent(this.pattern) : super();
}

class SortAscProductsEvent extends ProductPageEvent {
  final List<Product> shownList;
  const SortAscProductsEvent(this.shownList) : super();
}

class SortDescProductsEvent extends ProductPageEvent {
  final List<Product> shownList;
  const SortDescProductsEvent(this.shownList) : super();
}