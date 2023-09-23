import 'dart:math';

import 'package:flutter/foundation.dart';

import '../../domain/product_manager/i_repository.dart';
import '../../domain/product_manager/product.dart';

class Repository implements IRepository {
  Repository();

  @override
  Future<List<Product>> generateFakeProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    // const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (kDebugMode) {
      print("Generating product list...");
    }
    return List.generate(
      10,
      (index) => Product(
       // title: 'Product ${characters[index % characters.length]}$index',
       // description: 'Description $index',
        title: getRandomString(10),
        description: getRandomString(15),
      ),
    );
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));