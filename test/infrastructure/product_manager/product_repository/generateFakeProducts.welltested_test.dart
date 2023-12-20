import 'generateFakeProducts.welltested_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:product_list/domain/product_manager/entity/product.dart';
import 'package:product_list/infrastructure/product_manager/product_repository.dart';

@GenerateMocks([ProductRepository])
void main() {
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
  });

  group('generateFakeProducts', () {
    test(
        'should return List<Product> when fake products are generated successfully',
        () async {
      final fakeProducts = List.generate(
          20,
          (index) =>
              Product(title: 'title$index', description: 'description$index'));

      when(mockProductRepository.generateFakeProducts())
          .thenAnswer((_) async => Left(fakeProducts));

      final result = await mockProductRepository.generateFakeProducts();

      expect(result, equals(Left(fakeProducts)));
    });

    test('should return Exception when fake products generation fails',
        () async {
      final exception = Exception();

      when(mockProductRepository.generateFakeProducts())
          .thenAnswer((_) async => Right(exception));

      final result = await mockProductRepository.generateFakeProducts();

      expect(result, equals(Right(exception)));
    });
  });
}
