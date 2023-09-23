import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_manager/product_bloc.dart';
import 'package:product_list/application/product_manager/product_event.dart';
import 'package:product_list/application/product_manager/product_state.dart';

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
        if (state is ProductPageInitialState) {
          return const Center(child: Text("Product List App"));
        }
        if (state is ProductPageLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon:
                          Icon(Icons.search), // Add your leading icon here
                    ),
                    onChanged: (v) {
                      context
                          .read<ProductPageBloc>()
                          .add(SearchProductsEvent(v));
                    },
                  )),
                  IconButton(
                      onPressed: () {
                        (state.sortType == SortType.asc)
                            ? context
                            .read<ProductPageBloc>()
                            .add(SortDescProductsEvent(state.shownList))
                            : (state.sortType == SortType.desc)
                            ? context
                            .read<ProductPageBloc>()
                            .add(SortAscProductsEvent(state.shownList))
                            : context
                            .read<ProductPageBloc>()
                            .add(SortAscProductsEvent(state.shownList));

                      },
                      icon: (state.sortType == SortType.asc)
                          ? const Icon(Icons.arrow_downward)
                          : (state.sortType == SortType.desc)
                              ? const Icon(Icons.arrow_upward)
                              : const Icon(Icons.sort))
                ],
              ),
            ),
            (state is ProductPageProcessingState)
                ? const Padding(
                    padding: EdgeInsets.only(top: 100, left: 30, right: 30),
                    child: LinearProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.shownList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.shownList[index].title),
                        subtitle: Text(state.shownList[index].description),
                      );
                    },
                  ),
          ],
        );
      }),
    );
  }
}
