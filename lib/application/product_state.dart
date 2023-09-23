import 'package:equatable/equatable.dart';

abstract class ProductPageState extends Equatable {

  const ProductPageState();

  @override
  List<Object> get props => [

  ];
}

class ProductPageInitialState extends ProductPageState {
  const ProductPageInitialState();


  factory ProductPageInitialState.emptyState() {
    return const ProductPageInitialState();
  }
}