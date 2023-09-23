import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/presentation/home_page.dart';

import 'application/product_bloc.dart';
import 'injection_container.dart';

void main() async {
  await configureCore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductPageBloc>(
          create: (BuildContext context) => core<ProductPageBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Product List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
