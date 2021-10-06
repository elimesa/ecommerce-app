import 'package:ecommerce_app/src/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/src/models/models.dart';
import 'package:ecommerce_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona tus productos'),
      ),
      body: AllProductList(),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  Widget getProductsView(BuildContext context) {
    return AllProductList();
  }
}

class AllProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoaded) {
            return ListView(
              shrinkWrap: true,
              children: _getCards(state.products),
            );
          } else {
            return Text("Something went wrong");
          }
        })
      ],
    );
  }

  List<ProductCard> _getCards(List<Product> items) {
    return items.map(
      (Product product) {
        return ProductCard(product);
      },
    ).toList();
  }
}

class ProductList extends StatelessWidget {
  final List<Product> _products;

  ProductList(this._products);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(30),
          scrollDirection: Axis.vertical,
          children: _products.map((product) {
            return getCard(product);
          }).toList(),
        ))
      ],
    );
  }

  Widget getCard(Product product) {
    return ProductCard(product);
  }
}
