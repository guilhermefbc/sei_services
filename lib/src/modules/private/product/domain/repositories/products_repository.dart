import 'package:sei_services/src/modules/private/product/data/datasources/local/product_db.dart';
import 'package:sei_services/src/modules/private/product/data/models/product_model.dart';
import 'package:sei_services/src/modules/private/product/domain/entities/product_entity.dart';

class ProductsRepository {
  final ProductsDB _db;
  List<ProductEntity> _products = [];
  ProductsRepository(this._db);

  List<ProductEntity> get products => _products;

  Future<void> save(List<ProductModel> products) async {
    _products.addAll(products);
    await _saveInLocalDB(products);
  }
  
  Future<void> _saveInLocalDB(List<ProductModel> products) async {
    for(ProductModel product in products) {
      _db.saveProduct(product);
    }
  }

  Future<void> _getAllProductsFromLocalDB() async {
    if(_products.isEmpty) {
      _products.addAll(await _db.getProducts());
    }
  }

  Future<void> _getProductsFromLocalDBByTransaction(String transactionId) async {
    if(!_thereAreTransactionProducts(transactionId)) {
      _products.addAll(await _db.getProductsByTransactionId(transactionId));
    }
  }

  bool _thereAreTransactionProducts(String transactionId) {
    return _products.any((product) => product.transactionId == transactionId);
  }
  
  Future<List<ProductEntity>> getAllProducts() async {
    await _getAllProductsFromLocalDB();
    return _products;
  }

  List<ProductEntity> getProductsByTransactionId(String? transactionId) {
    return _products.where((product) => product.transactionId == transactionId).toList();
  }

  void deleteProduct(ProductEntity product) {
    _products.remove(product);
    _db.deleteByProductId(product.productId!);
  }

  void deleteProductsByTransaction(String transactionId) {
    _products.removeWhere((product) {
      return product.transactionId == transactionId;
    });
    _db.deleteByTransactionId(transactionId);
  }
}