import 'package:mobx/mobx.dart';
import 'package:sei_services/src/modules/private/scanner/domain/enum/scanner_status_enum.dart';
part 'scanner_controller.g.dart';

class ScannerController = _ScannerController with _$ScannerController;

abstract class _ScannerController with Store {
  @observable
  String? code = '';

  @observable
  bool loading = false;

  @action
  void setCode(String? value) {
    code = value;
  }

  ScannerStatusEnum status = ScannerStatusEnum.error;
  bool get isSuccess => status == ScannerStatusEnum.success;
}