import 'package:get_it/get_it.dart';
import 'package:product_list/domain/i_repository.dart';

import 'application/product_bloc.dart';
import 'infrastructure/repository.dart';

final core = GetIt.instance;

Future configureCore() async => await init();

Future<void> init() async {

  core.registerLazySingleton<IRepository>(() => Repository());
  core.registerFactory(() => ProductPageBloc(core()));
}