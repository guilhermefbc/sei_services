import 'package:sei_services/src/shared/data/datasources/local/product_db.dart';
import 'package:sei_services/src/shared/data/models/product_model.dart';
import 'package:sei_services/src/shared/domain/abstract/persistence_abstract.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';

class ProductsRepository {
  final ProductsDB _db;
  List<ProductEntity> _products = [];
  ProductsRepository(this._db);
  
  Future<void> save(List<ProductModel> products) async {
    _products.addAll(products);
    await _saveInLocalDB(products);
  }
  
  Future<void> _saveInLocalDB(List<ProductModel> products) async {
    for(ProductModel product in products) {
      _db.saveProduct(product);
    }
  }

  // Future<List<ProductEntity>> getByLocalDB() async {
  //
  // }

  Future<List<ProductEntity>> getProducts() async {
    return _products;
  }

}