import 'package:product_list/domain/product_manager/entity/product.dart';

abstract class IProductRepository {
  Future<List<Product>> generateFakeProducts();
}