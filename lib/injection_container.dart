import 'package:get_it/get_it.dart';
import 'package:product_list/domain/product_manager/generate_fake_products.dart';
import 'package:product_list/domain/product_manager/i_repository.dart';
import 'package:product_list/domain/product_manager/search_products.dart';
import 'package:product_list/domain/product_manager/sort_asc_products.dart';
import 'package:product_list/domain/product_manager/sort_desc_products.dart';

import 'application/product_manager/product_bloc.dart';
import 'infrastructure/product_manager/repository.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {
  core.registerFactory(() => ProductPageBloc(core(), core(), core(), core()));
  core.registerLazySingleton<IRepository>(() => Repository());
  core.registerLazySingleton<GenerateFakeProducts>(() => GenerateFakeProducts(core()));
  core.registerLazySingleton<SearchProducts>(() => SearchProducts());
  core.registerLazySingleton<SortAscProducts>(() => SortAscProducts());
  core.registerLazySingleton<SortDescProducts>(() => SortDescProducts());
}