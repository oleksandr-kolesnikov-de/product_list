import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/application/product_manager/product_bloc.dart';
import 'package:product_list/application/product_manager/product_event.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context
              .read<ProductPageBloc>()
              .add(const GenerateFakeProductsEvent());
        },
        child: Ink(
            color: Colors.blue,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ERROR",
                      style: TextStyle(
                          backgroundColor: Colors.white,
                          fontFamily: 'Courier New')),
                  Text("Press any key to continue...",
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Courier New')),
                ],
              ),
            )));
  }
}
