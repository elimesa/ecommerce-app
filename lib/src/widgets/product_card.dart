import 'package:ecommerce_app/src/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/src/config/styles.dart';
import 'package:ecommerce_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/config/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      Expanded(
        flex: 1,
        child: Container(
          child: InkWell(
              onTap: () {},
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              )),
        ),
      ),
      Expanded(
          flex: 3,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: Heading4Style,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('\$${product.price} USD', style: Body1Style),
              ])),
      BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          return Expanded(
              flex: 2,
              child: IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                ),
                onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product));
                },
              ));
        } else {
          return Text('Something went wrong');
        }
      })
    ];

    return Padding(
        padding: EdgeInsets.only(bottom: 10, left: 10, top: 10, right: 10),
        child: Container(
          decoration: productsAddDecoration,
          height: utils.getHeight(80),
          margin: EdgeInsets.all(6.0),
          padding: EdgeInsets.all(6.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ));
  }
}
