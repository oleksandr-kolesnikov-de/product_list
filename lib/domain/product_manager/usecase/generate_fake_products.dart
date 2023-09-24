import 'package:dartz/dartz.dart';
import 'package:product_list/domain/core/use_case.dart';
import 'package:product_list/domain/product_manager/entity/product.dart';

import '../repository/i_product_repository.dart';

class GenerateFakeProducts
    extends UseCase<Future<Either<List<Product>, Exception>>, NoParams> {
  final IProductRepository repository;

  GenerateFakeProducts(this.repository);

  @override
  Future<Either<List<Product>, Exception>> call(NoParams params) async {
    return await repository.generateFakeProducts();
  }
}
