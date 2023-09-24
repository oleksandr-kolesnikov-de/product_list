import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_list/application/product_manager/product_bloc.dart';
import 'package:product_list/application/product_manager/product_event.dart';
import 'package:product_list/application/product_manager/product_state.dart';
import 'package:product_list/domain/product_manager/entity/product.dart';
import 'package:product_list/presentation/product_manager/product_manager_screen.dart';

class MockProductPageBloc extends MockBloc<ProductPageEvent, ProductPageState>
    implements ProductPageBloc {}

class ProductPageStateFake extends Fake implements ProductPageState {}

class ProductPageEventFake extends Fake implements ProductPageEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue(ProductPageEventFake());
    registerFallbackValue(ProductPageStateFake());
  });

  _somePage();
}

void _somePage() {
  testWidgets('All widgets are correctly rendered on product screen',
      (tester) async {
    
    // arange

    final mockProductPageBloc = MockProductPageBloc();

    List<Product> list = [
      Product(title:"A", description: "a"),
      Product(title:"A", description: "a"),
      Product(title:"A", description: "a"),
    ];
    List<Product> shownList = [
      Product(title:"A", description: "a"),
      Product(title:"A", description: "a"),
      Product(title:"A", description: "a"),
    ];
    when(() => mockProductPageBloc.state).thenReturn(
      ProductPageLoadedState(list, shownList, SortType.no), // the desired state
    );

    // test

    final page = MultiBlocProvider(
      providers: [
        BlocProvider<ProductPageBloc>(
          lazy: false,
          create: (context) => mockProductPageBloc,
        ),
      ],
      child: const MaterialApp(
        home: ProductManagerScreen(),
      ),
    );

    await tester.pumpWidget(page);
    await tester.pumpAndSettle();

    final searchFinder = find.byKey(const Key("SearchBox"));
    final sortFinder = find.byKey(const Key("SortButton"));
    final tilesFinder = find.byKey(const Key("ListTile"));
    
    // verify

    expect(searchFinder, findsOneWidget);
    expect(sortFinder, findsOneWidget);
    expect(tilesFinder, findsNWidgets(3));
  });
}
