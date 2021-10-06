import 'package:ecommerce_app/src/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];

  Map productQuantity(products) {
    var quantity = Map();
    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  double deliveryFee(subtotal) {
    if (subtotal >= 15) {
      return 0.0;
    } else {
      return 5.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 15) {
      return 'Tú envio es GRATIS';
    } else {
      double missing = 15.0 - subtotal;
      return 'Agrega \$${missing.toStringAsFixed(2)} para que tu envío sea GRATIS';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }
}
