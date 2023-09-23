import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_bloc.dart';
import 'package:product_list/application/product_event.dart';

import '../application/product_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocBuilder<ProductPageBloc, ProductPageState>(
          builder: (context, state) {
        return ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.list[index].title),
                subtitle: Text(state.list[index].description),
              );
          },
        );
      }),
    );
  }
}
