import 'package:ecommerce_app/src/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/src/config/styles.dart';
import 'package:ecommerce_app/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/config/utils.dart' as utils;
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: [
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
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CartLoaded) {
                    return Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductRemoved(product));
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.blue,
                              )),
                          Text('1'),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                              },
                              icon: Icon(Icons.add_circle, color: Colors.blue)),
                        ],
                      ),
                    );
                  } else {
                    return Text('Something went wrong');
                  }
                }),
              ]),
        ));
  }
}
