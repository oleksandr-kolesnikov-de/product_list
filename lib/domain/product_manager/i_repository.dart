import 'package:product_list/domain/product_manager/product.dart';

abstract class IRepository {
  Future<List<Product>> generateFakeProducts();
}