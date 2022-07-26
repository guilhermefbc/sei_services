import 'package:sei_services/src/shared/data/datasources/local/product_db.dart';
import 'package:sei_services/src/shared/domain/abstract/persistence_abstract.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';

class ProductsRepository implements Persistence {
  final ProductsDB _db;
  List<ProductEntity> _products = [];
  ProductsRepository(this._db);

  @override
  Future<void> save(product) async {
    _products.add(product);
    await saveInLocalDB(product);
  }

  @override
  Future<void> saveInLocalDB(product) async {

  }

}