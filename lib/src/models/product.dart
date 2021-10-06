import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final int sku;
  final String description;
  final String imageUrl;
  final double price;

  const Product(
      {required this.name,
      required this.sku,
      required this.description,
      required this.imageUrl,
      required this.price});

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    return Product(
      name: snapshot['name'],
      sku: snapshot['sku'],
      description: snapshot['description'],
      imageUrl: snapshot['imageUrl'],
      price: snapshot['price'].toDouble(),
    );
  }

  @override
  List<Object?> get props => [name, sku, description, imageUrl, price];
}
