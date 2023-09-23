import 'package:get_it/get_it.dart';
import 'package:product_list/domain/product_manager/usecase/generate_fake_products.dart';
import 'package:product_list/domain/product_manager/repository/i_product_repository.dart';
import 'package:product_list/domain/product_manager/usecase/search_products.dart';
import 'package:product_list/domain/product_manager/usecase/sort_asc_products.dart';
import 'package:product_list/domain/product_manager/usecase/sort_desc_products.dart';

import 'application/product_manager/product_bloc.dart';
import 'infrastructure/product_manager/product_repository.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {
  core.registerFactory(() => ProductPageBloc(core(), core(), core(), core()));
  core.registerLazySingleton<IProductRepository>(() => ProductRepository());
  core.registerLazySingleton<GenerateFakeProducts>(() => GenerateFakeProducts(core()));
  core.registerLazySingleton<SearchProducts>(() => SearchProducts());
  core.registerLazySingleton<SortAscProducts>(() => SortAscProducts());
  core.registerLazySingleton<SortDescProducts>(() => SortDescProducts());
}