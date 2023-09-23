class Product {
  final String title;
  final String description;

  Product({
    required this.title,
    required this.description,
  });
}

Comparator<Product> productComparator = (a, b) => a.title!.compareTo(b.title!);
