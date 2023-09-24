import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    final String? title,
    final String? description,
  }) = _Product;
}
  // To extend example we generate class with freezed and
  // also we detach generateFakeProducts
  // from Product class. If we want to stay with "old" implementation,
  // we should use static access to generate List like this:
  // List<Product> list = await Product.generateFakeProducts();

