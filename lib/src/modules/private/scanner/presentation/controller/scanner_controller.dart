import 'package:sei_services/src/modules/private/scanner/domain/enum/scanner_status_enum.dart';

class ScannerController {
  ScannerStatusEnum status = ScannerStatusEnum.error;

  bool get isSuccess => status == ScannerStatusEnum.success;
}