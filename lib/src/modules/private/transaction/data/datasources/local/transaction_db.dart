import 'dart:async';
import 'package:path/path.dart';
import 'package:sei_services/src/modules/private/transaction/data/models/transaction_model.dart';
import 'package:sei_services/src/modules/private/transaction/domain/entities/transaction_entity.dart';
import 'package:sqflite/sqflite.dart';

class TransactionDB {
  static final TransactionDB _instance = TransactionDB.internal();
  factory TransactionDB() => _instance;
  TransactionDB.internal();
  static Database? _db;

  final String _transactionsTable = 'transactionsTable';
  final String _transactionType = 'transactionType';
  final String _transactionAmount = 'transactionAmount';
  final String _sellDate = 'sellDate';
  final String _storeName = 'storeName';
  final String _totalTaxes = 'totalTaxes';
  final String _expenseGroupId = "expenseGroupId";
  final String _expenseType = "expenseType";
  final String _transactionId = "transactionId";
  final String _accountNumber = "accountNumber";
  final String _ownerId = "ownerId";
  final String _ownerEmail = "ownerEmail";
  final String _codigoNotaFiscal = "codigoNotaFiscal";
  final String _isOwner = "isOwner";
  final String _cpf = "cpf";

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "transactions.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database sei, int newerVersion) async {
          await sei.execute(''' 
          CREATE TABLE $_transactionsTable (
            $_transactionId TEXT PRIMARY KEY, 
            $_expenseGroupId TEXT,
            $_accountNumber INTEGER,
            $_expenseType TEXT,
            $_transactionType TEXT,
            $_transactionAmount REAL,
            $_storeName TEXT,
            $_sellDate TEXT,
            $_totalTaxes REAL,
            $_codigoNotaFiscal TEXT,
            $_cpf TEXT
          ) 
        ''');
        });
  }

  Future<void> saveTransaction(TransactionModel transaction) async {
    Database dbTransaction = await db;
    try {
      await dbTransaction.insert(_transactionsTable, transaction.toMap());
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> deleteTransaction(TransactionModel transaction) async {
    Database dbTransaction = await db;
    try {
      await dbTransaction.delete(_transactionsTable,
          where: '$_transactionId = ?',
          whereArgs: [transaction.transactionId]);
    } catch (error) {
      throw Exception(error);
    }
  }
  

  Future<List<TransactionEntity>> getAllTransactions() async {
    Database dbTransaction = await db;
    List transactions = await dbTransaction.rawQuery("SELECT * FROM $_transactionsTable");
    return transactions.map((transaction) => TransactionModel.fromMap(transaction)).toList();
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    try {
      Database dbTransaction = await db;
      await dbTransaction.update(
          _transactionsTable, transaction.toMap(),
          where: "$_transactionId = ?",
          whereArgs: [transaction.transactionId]);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future close() async {
    Database dbTransaction = await db;
    dbTransaction.close();
  }

}