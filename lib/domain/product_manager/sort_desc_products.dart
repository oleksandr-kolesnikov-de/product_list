import 'package:equatable/equatable.dart';
import 'package:product_list/domain/core/use_case.dart';
import 'package:product_list/domain/product_manager/product.dart';

class SortDescProducts extends UseCase<Future<List<Product>>, SortDescProductsParams> {
  SortDescProducts();

  @override
  Future<List<Product>> call(SortDescProductsParams params) async {
    List<Product> newShownProduct = params.list;
    newShownProduct.sort(productComparator);
    return List.from(newShownProduct.reversed);
  }
}

class SortDescProductsParams extends Equatable {

  final List<Product> list;

  const SortDescProductsParams(this.list);
  @override
  List<Object?> get props => [list];
}