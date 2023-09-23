import 'package:equatable/equatable.dart';

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
  const SortAscProductsEvent() : super();
}

class SortDescProductsEvent extends ProductPageEvent {
  const SortDescProductsEvent() : super();
}