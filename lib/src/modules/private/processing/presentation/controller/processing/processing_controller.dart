import 'package:mobx/mobx.dart';
import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';
part 'processing_controller.g.dart';

class ProcessingController = _ProcessingController with _$ProcessingController;

abstract class _ProcessingController with Store {
  List<ProcessingEntity> processing = ObservableList<ProcessingEntity>();

  @action
  void addAllProcessing(List<ProcessingEntity> values) {
    processing.addAll(values);
  }

  @action
  void addProcessing(ProcessingEntity value) {
    processing.add(value);
  }

  @action
  void removeProcessing(ProcessingEntity value) {
    processing.remove(value);
  }
}