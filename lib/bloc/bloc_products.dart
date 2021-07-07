import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_yaax/models/product_entity.dart';
import 'package:flutter_yaax/repositories/product_repository.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
  ProductsBloc(this.productRepository) : super(ProductsStateLoading());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event == ProductsEvent.LOAD) {
      yield* _mapToLoad();
    }
  }

  Stream<ProductsState> _mapToLoad() async* {
    try {
      var products = await productRepository.getProducts();
      yield ProductsStateLoaded(products);
    } catch (e) {
      print(e);
      yield ProductsStateError();
    }
  }
}

abstract class ProductsState {
  const ProductsState();
}

class ProductsStateLoading extends ProductsState {}

class ProductsStateLoaded extends ProductsState {
  final List<Product> products;
  const ProductsStateLoaded(this.products);
}

class ProductsStateError extends ProductsState {}

///events
enum ProductsEvent { LOAD, UPDATE }
