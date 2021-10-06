import 'package:ecommerce_app/src/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/src/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/src/blocs/simple_bloc_observer.dart';
import 'package:ecommerce_app/src/blocs/wishlist/wish_list_bloc.dart';
import 'package:ecommerce_app/src/config/app_router.dart';
import 'package:ecommerce_app/src/repository/product/product_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/screeens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WishListBloc()..add(StartWishList())),
          BlocProvider(
              create: (_) => ProductBloc(
                    productRepository: ProductRepository(),
                  )..add(
                      LoadProducts(),
                    )),
          BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ));
  }
}
