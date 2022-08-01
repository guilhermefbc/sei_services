import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:sei_services/src/modules/private/scanner/data/datasources/remote/scanner_service.dart';
import 'package:sei_services/src/modules/private/scanner/domain/scanner_status_enum.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/controller/scanner_controller.dart';
import 'package:sei_services/src/shared/util/scanner/bar_code_util.dart';
import 'package:sei_services/src/shared/util/scanner/qr_code_util.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScannerUtil {
  final int _minNumberToBeValid = 44;
  final ScannerService _service;
  final ScannerController _controller;
  ScannerUtil(this._service, this._controller);

  Future<void> scanDoc(String? code) async {
    if(_isValidCode(code)) {
      String result = _getDocumentCode(code!);
      await _isValidResult(result);
    }else{
      _controller.status = ScannerStatusEnum.invalidCode;
    }
  }

  Future<void> _isValidResult(String result) async {
    if(result.isNotEmpty) {
      await _workWithResult(result);
    }else{
      _controller.status = ScannerStatusEnum.invalidCode;
    }
  }

  Future<void> _workWithResult(String code) async {
    Vibrate.vibrate();
    int? result = await _service.postQRBill(code);

    switch(result) {
      case 200:
        _controller.status = ScannerStatusEnum.success;
        break;
      case 202:
        _controller.status = ScannerStatusEnum.success;
        break;
      case 409:
        _controller.status = ScannerStatusEnum.repeated;
        break;
      default:
      _controller.status = ScannerStatusEnum.error;
    }

    // Modular.to.navigate('/private/transaction/');
    debugPrint('Barcode found! $result');
  }

  String _getDocumentCode(String code) {
    if(BarCodeUtil.isBarCode(code)) {
      return code;
    }else{
      return QrCodeUtil.getQRCode(code);
    }
  }

  bool _isValidCode(String? code) {
    return code != null
        && code.isNotEmpty
        && code.length >= _minNumberToBeValid;
  }
}