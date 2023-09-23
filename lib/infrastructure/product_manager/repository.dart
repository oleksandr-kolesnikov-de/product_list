import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:product_list/domain/product_manager/i_repository.dart';
import 'package:product_list/domain/product_manager/product.dart';

class Repository implements IRepository {
  Repository();

  final _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Future<List<Product>> generateFakeProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    // const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (kDebugMode) {
      print("Generating product list...");
    }
    return List.generate(
      20,
      (index) => Product(
       // title: 'Product ${characters[index % characters.length]}$index',
       // description: 'Description $index',
        title: getRandomString(10),
        description: getRandomString(15),
      ),
    );
  }
}

