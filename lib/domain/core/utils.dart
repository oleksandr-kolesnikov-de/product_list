import 'package:product_list/domain/product_manager/entity/product.dart';

Comparator<Product> productComparator = (a, b) {
  final titleComparison = a.title!.compareTo(b.title!);
  if (titleComparison == 0) {
    // If titles are the same, compare by description
    return a.description!.compareTo(b.description!);
  }
  // If titles are different, return the title comparison result
  return titleComparison;
};