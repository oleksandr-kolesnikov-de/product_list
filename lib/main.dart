import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_manager/product_event.dart';
import 'package:product_list/presentation/product_manager/home_page.dart';

import 'application/product_manager/product_bloc.dart';
import 'injection_container.dart';

void main() async {

  await configureCore();
  runApp(const ProductListApp());
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductPageBloc>(
          create: (BuildContext context) =>
              core<ProductPageBloc>()..add(const GenerateFakeProductsEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Product List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),

      ),

    );
  }
}
