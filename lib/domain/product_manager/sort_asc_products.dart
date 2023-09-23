import 'package:equatable/equatable.dart';
import 'package:product_list/domain/core/use_case.dart';
import 'package:product_list/domain/core/utils.dart';
import 'package:product_list/domain/product_manager/product.dart';

class SortAscProducts extends UseCase<Future<List<Product>>, SortAscProductsParams> {
  SortAscProducts();

  @override
  Future<List<Product>> call(SortAscProductsParams params) async {
    await Future.delayed(const Duration(milliseconds: 300));
    List<Product> newShownProduct = params.list;
    newShownProduct.sort(productComparator);
    return newShownProduct;
  }
}

class SortAscProductsParams extends Equatable {

  final List<Product> list;

  const SortAscProductsParams(this.list);
  @override
  List<Object?> get props => [list];
}