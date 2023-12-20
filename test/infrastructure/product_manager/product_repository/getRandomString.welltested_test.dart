import 'getRandomString.welltested_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:product_list/infrastructure/product_manager/product_repository.dart';

@GenerateMocks([ProductRepository])
void main() {
  late ProductRepository productRepository;

  setUp(() {
    productRepository = MockProductRepository();
  });

  group('getRandomString', () {
    test('should return a string of the specified length', () {
      const length = 10;
      when(productRepository.getRandomString(length))
          .thenAnswer((_) => 'abcdefghij');

      final result = productRepository.getRandomString(length);

      expect(result.length, equals(length));
    });

    test('should return a string containing only valid characters', () {
      const length = 10;
      when(productRepository.getRandomString(length))
          .thenAnswer((_) => 'abcdefghij');
      when(productRepository.chars).thenAnswer((_) => 'abcdefghij');

      final result = productRepository.getRandomString(length);

      for (var i = 0; i < result.length; i++) {
        expect(productRepository.chars.contains(result[i]), isTrue);
      }
    });
  });
}
