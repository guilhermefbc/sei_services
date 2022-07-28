import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:sei_services/src/modules/private/scanner/data/datasources/remote/scanner_service.dart';
import 'package:sei_services/src/shared/util/scanner/bar_code_util.dart';
import 'package:sei_services/src/shared/util/scanner/qr_code_util.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ScannerUtil {
  final int _minNumberToBeValid = 44;
  final ScannerService _service;
  ScannerUtil(this._service);

  void scanDoc(String? code) {
    if(_isValidCode(code)) {
      String result = _getDocumentCode(code!);
      _isValidResult(result);
    }
  }

  void _isValidResult(String result) {
    if(result.isNotEmpty) {
      _workWithResult(result);
    }
  }

  Future<void> _workWithResult(String result) async {
    Vibrate.vibrate();
    _service.postQRBill(result);
    Modular.to.navigate('/private/transaction/');
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