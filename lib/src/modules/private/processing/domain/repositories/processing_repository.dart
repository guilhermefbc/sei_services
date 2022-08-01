import 'package:sei_services/src/modules/private/processing/data/datasources/local/processing_db.dart';
import 'package:sei_services/src/modules/private/processing/data/models/processing_model.dart';
import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';

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

  Future<void> deleteProcessing(String code) async {
    await _db.deleteProcessing(code);
  }

  Future<void> saveProcessing(String code) async {
    ProcessingModel processingObject =
        ProcessingModel(code: code, date: DateTime.now());
    processing.add(processingObject);
    await _db.saveProcessing(processingObject);
  }
}
