import 'package:equatable/equatable.dart';

abstract class ProductPageEvent extends Equatable {
  const ProductPageEvent();

  @override
  List<Object> get props => [];
}

class GenerateFakeProductsEvent extends ProductPageEvent {
  const GenerateFakeProductsEvent() : super();
}