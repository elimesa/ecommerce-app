import 'package:ecommerce_app/src/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/src/config/styles.dart';
import 'package:ecommerce_app/src/config/utils.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/src/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mi carrito'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text(
                      'Ir a pagar',
                      style: Heading4Style.copyWith(
                        fontSize: 18,
                      ),
                    ))
              ],
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            state.cart.freeDeliveryString,
                            style: Heading4Style.copyWith(color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Text(
                                'Agrega más productos',
                                style:
                                    Heading4Style.copyWith(color: Colors.white),
                              )),
                        ),
                        SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: state.cart.products.length,
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                  product: state.cart.products[index],
                                );
                              },
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 2,
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('SubTotal:',
                                        style: Heading4Style.copyWith(
                                            fontSize: 18)),
                                    Text('\$${state.cart.subtotalString}',
                                        style: Heading4Style.copyWith(
                                            fontSize: 20)),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Envio:',
                                        style: Heading4Style.copyWith(
                                            fontSize: 18)),
                                    Text('\$${state.cart.deliveryFeeString}',
                                        style: Heading4Style.copyWith(
                                            fontSize: 20)),
                                  ],
                                ),
                              ],
                            )),
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: getHeight(60),
                              decoration: BoxDecoration(
                                  color: Colors.blue.withAlpha(50)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('Total:',
                                          style: Heading4Style.copyWith(
                                              fontSize: 18)),
                                      Text('\$${state.cart.totalString}',
                                          style: Heading4Style.copyWith(
                                              fontSize: 20)),
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ));
  }
}
