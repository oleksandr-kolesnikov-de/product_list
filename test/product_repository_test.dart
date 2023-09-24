import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_list/infrastructure/product_manager/product_repository.dart';

void main() {
  ProductRepository repository;

  setUp(() {});

    test('Repository generates exactly 20 products', () async {
      // arrange
      repository = ProductRepository();

      // test
      Either result = await repository.generateFakeProducts();
      result.fold((l) {
        // verify
        expect(l.length, 20);
      }, (r) {});


  });
}
