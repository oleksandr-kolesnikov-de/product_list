import 'package:product_list/domain/product_manager/product.dart';

Comparator<Product> productComparator = (a, b) => a.title.compareTo(b.title);