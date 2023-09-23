import 'package:equatable/equatable.dart';
import 'package:product_list/domain/core/use_case.dart';
import 'package:product_list/domain/product_manager/product.dart';

class SearchProducts extends UseCase<Future<List<Product>>, SearchProductsParams> {
  SearchProducts();

  @override
  Future<List<Product>> call(SearchProductsParams params) async {
    await Future.delayed(const Duration(milliseconds: 500));
    List<Product> filteredProducts = params.list.where((product) {
      return product.title.toLowerCase().startsWith(params.pattern.toLowerCase());
    }).toList();
    return filteredProducts;
  }
}

class SearchProductsParams extends Equatable {
  final String pattern;
  final List<Product> list;

  const SearchProductsParams(this.pattern, this.list);
  @override
  List<Object?> get props => [pattern, list];
}