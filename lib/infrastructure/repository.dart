import '../domain/i_repository.dart';
import '../domain/product.dart';

class Repository implements IRepository {
  Repository();

  @override
  Future<List<Product>> generateFakeProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return List.generate(
      10,
      (index) => Product(
        title: 'Product ${characters[index % characters.length]}$index',
        description: 'Description $index',
      ),
    );
  }
}
