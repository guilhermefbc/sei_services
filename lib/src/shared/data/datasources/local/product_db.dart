import 'dart:async';
import 'package:path/path.dart';
import 'package:sei_services/src/shared/data/models/product_model.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
import 'package:sqflite/sqflite.dart';


class ProductsDB {
  static final ProductsDB _instance = ProductsDB.internal();
  factory ProductsDB() => _instance;
  ProductsDB.internal();
  static Database? _db;

  final String _pathDBFileName = "products.db";
  final String _productsTable = "productsTable";
  final String _productId = "productId";
  final String _transactionId = "transactionId";
  final String _description = "description";
  final String _eanCode = "eanCode";
  final String _quantity = "quantity";
  final String _metric = "metric";
  final String _price = "price";
  final String _productCode = "productCode";
  final String _ncmCode = "ncmCode";
  final String _genre = "genre";
  final String _cfop = "cfop";
  final String _discount = "discount";
  final String _approximateTaxation = "approximateTaxation";
  final String _productOrigin = "productOrigin";
  final String _icmsTaxation = "icmsTaxation";
  final String _isFavorite = "isFavorite";
  final String _expenseType = "expenseType";
  final String _isStockable = "isStockable";
  final String _isMedicine = "isMedicine";

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await _initDb();
      return _db!;
    }
  }

  Future<Database> _initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, _pathDBFileName);

    return await openDatabase(path, version: 1,
        onCreate: (Database sei, int newerVersion) async {
          await sei.execute(''' 
          CREATE TABLE $_productsTable (
            $_productId TEXT PRIMARY KEY,
            $_transactionId TEXT,
            $_description TEXT,
            $_eanCode TEXT,
            $_quantity REAL,
            $_metric TEXT,
            $_price REAL,
            $_productCode TEXT,
            $_genre TEXT,
            $_cfop TEXT,
            $_discount TEXT,
            $_approximateTaxation REAL,
            $_productOrigin TEXT,
            $_icmsTaxation REAL,
            $_isFavorite INTEGER,
            $_expenseType TEXT,
            $_isStockable INTEGER,
            $_isMedicine INTEGER
          ) 
        ''');
        });
  }
  

  Future<void> saveProduct(ProductModel product) async {
    try {
      Database dbProduct = await db;
      await dbProduct.insert(_productsTable, product.toMap());
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<List<ProductEntity>> getProducts() async {
    try{
      Database dbProduct = await db;
      List<Map<String, dynamic>> products = await dbProduct.rawQuery("SELECT * FROM $_productsTable");
      return products.map((product) => ProductModel.fromMap(product)).toList();
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<List<ProductEntity>> getProductsByTransactionId(String transactionId) async {
    try{
      Database dbProduct = await db;
      List<Map<String, dynamic>> products =
      await dbProduct.rawQuery("SELECT * FROM $_productsTable WHERE $_transactionId = $transactionId");
      return products.map((product) => ProductModel.fromMap(product)).toList();
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> updateProduct(ProductModel productProvider) async {
    try{
      Database dbExpenseGroup = await db;
      await dbExpenseGroup.update(_productsTable,
          productProvider.toMap(),
          where: "$_productId = ?",
          whereArgs: [productProvider.productId]);
    }catch(error) {
      throw Exception(error);
    }
  }

  Future<void> deleteByProductId(int productId) async {
    try{
      Database dbProduct = await db;
      await dbProduct.delete(_productsTable, where: "$_productId = ?", whereArgs: [productId]);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<void> deleteByTransactionId(String transactionId) async {
    try{
      Database dbProduct = await db;
      await dbProduct.delete(_productsTable, where: "$_transactionId = ?", whereArgs: [transactionId]);
    }catch(error) {
      throw Exception(error);
    }
  }
}