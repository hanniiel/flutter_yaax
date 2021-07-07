import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yaax/bloc/bloc_products.dart';
import 'package:flutter_yaax/ui/product_widget.dart';

class FavesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (_, state) {
        if (state is ProductsStateLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (_, index) {
              var product = state.products[index];
              return ProductWidget(product);
            },
            itemCount: state.products.length,
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
