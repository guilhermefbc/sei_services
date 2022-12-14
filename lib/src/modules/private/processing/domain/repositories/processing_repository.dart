import 'package:sei_services/src/modules/private/processing/data/datasources/local/processing_db.dart';
import 'package:sei_services/src/modules/private/processing/data/models/processing_model.dart';
import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';
import 'package:sei_services/src/modules/private/transaction/domain/entities/transaction_entity.dart';

class ProcessingRepository {
  final ProcessingDB _db;
  List<ProcessingEntity> processing = [];

  bool get isNotEmpty => processing.isNotEmpty;

  ProcessingRepository(this._db) {
    _init();
  }

  Future<void> _init() async {
    if (processing.isEmpty) {
      processing.addAll(await _db.getAllProcessing());
    }
  }

  Future<void> deleteProcessingList(List<TransactionEntity> transactions) async {
    List<String> codes = transactions
        .map<String>((transaction) => transaction.codigoNotaFiscal)
        .toList();
    for (String code in codes) {
      deleteProcessing(code);
    }
  }

  Future<void> deleteProcessing(String code) async {
    _removeProcessingFromTheList(code);
    await _db.deleteProcessing(code);
  }

  void _removeProcessingFromTheList(String code) {
    processing.removeWhere((element) {
      return element.code == code;
    });
  }

  Future<void> saveProcessing(String code) async {
    ProcessingModel processingObject =
        ProcessingModel(code: code, date: DateTime.now());
    processing.add(processingObject);
    await _db.saveProcessing(processingObject);
  }
}
