import 'package:dartz/dartz.dart';
import 'package:product_list/domain/product_manager/entity/product.dart';

abstract class IProductRepository {
  Future<Either<List<Product>, Exception>> generateFakeProducts();
}