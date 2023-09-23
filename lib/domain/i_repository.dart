import 'package:product_list/domain/product.dart';

abstract class IRepository {
  Future<List<Product>> generateFakeProducts();
}