import 'package:ecommerce_app/src/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
