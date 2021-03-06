import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/src/models/product.dart';
import 'package:ecommerce_app/src/repository/product/product_repository.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield* _mapLoadProductToState();
    } else if (event is UpdateProducts) {
      yield* _mapUpdateProductToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductToState() async* {
    _productSubscription?.cancel();
    _productSubscription =
        _productRepository.getAllProducts().listen((products) => add(
              UpdateProducts(products),
            ));
  }

  Stream<ProductState> _mapUpdateProductToState(UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }
}
