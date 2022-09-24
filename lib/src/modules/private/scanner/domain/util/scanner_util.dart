import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/scanner/data/datasources/remote/scanner_service.dart';
import 'package:sei_services/src/modules/private/scanner/domain/enum/scanner_status_enum.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/controller/scanner_controller.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/bar_code_util.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/qr_code_util.dart';

class ScannerUtil {
  final int _minNumberToBeValid = 44;
  final ScannerService _service;
  final ScannerController _controller;
  final ProcessingRepository _processing;
  ScannerUtil(this._service, this._controller, this._processing);

  Future<void> scanDoc(String? code) async {
    if(_isValidCode(code)) {
      code = code?.replaceAll(' ', '');
      final result = _getDocumentCode(code!);
      await _resultToWork(result);
    }else{
      _controller.status = ScannerStatusEnum.invalidCode;
    }
  }

  Future<void> _resultToWork(result) async {
    if(_isValidResult(result)) {
      await _workWithResult(result);
    }else{
      if(result == ScannerStatusEnum.error) {
        _controller.status = ScannerStatusEnum.error;
      }else if(result == ScannerStatusEnum.invalidState){
        _controller.status = ScannerStatusEnum.invalidState;
      }else{
        _controller.status = ScannerStatusEnum.invalidCode;
      }
    }
  }

  Future<void> _workWithResult(String code) async {
    try{
      Vibrate.vibrate();
      int? result = await _service.postQRBill(code);
      _setStatus(result);
      if(_controller.isSuccess) {
        _processing.saveProcessing(code);
      }
      debugPrint('Barcode found! $result');
    }catch(_) {
      _controller.status = ScannerStatusEnum.error;
    }
  }

  bool _isValidResult(result) {
    return result != null
        && result != ScannerStatusEnum.error
        && result != ScannerStatusEnum.invalidState
        && result is String
        && result.isNotEmpty
        && result.length == _minNumberToBeValid
        && _isValidCodeKey(result);
  }

  bool _isValidCodeKey(String code) {
    final List<int> multiplier = [2, 3, 4, 5, 6, 7, 8, 9];
    final int codeVerificationDigit = int.tryParse(code.substring(43,44)) ?? 0;
    final List<int> partialKey = code.substring(0,43).split('').map((numStr) {
      return int.tryParse(numStr) ?? 0;
    }).toList();

    int i = 42;
    int weightedSum = 0;

    while (i >= 0) {
      for (int j = 0; (j < multiplier.length && i >= 0); j++) {
        weightedSum += partialKey[i] * multiplier[j];
        i--;
      }
    }

    int rest = weightedSum % 11;
    int calculatedVerificationDigit = rest == 0 || rest == 1 ? 0 : 11 - rest;
    return calculatedVerificationDigit == codeVerificationDigit;
  }

  /// Get the result of processing code in backend
  /// and set a related status to this result
  void _setStatus(int? result) {
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
  }

  /// The result can be both String and
  /// ScannerStatusEnum
  _getDocumentCode(String code) {
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