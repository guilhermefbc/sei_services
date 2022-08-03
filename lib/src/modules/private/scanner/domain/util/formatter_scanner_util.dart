import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormatterScannerUtil {
  static String toStateCode(String code) {
    return code.substring(0,2);
  }

  static String extractCodeNumberByQRData(String rawContent) {
    final int startIndex = rawContent.indexOf('=') + 1;
    final int endIndex = rawContent.indexOf('|');
    
    return rawContent.substring(startIndex, endIndex);
  }

  static String formatNumericCode(String? code) {
    if(code == null || code.isEmpty) {
      return '';
    }
    String formattedCode = '';
    for(int i = 1; i <= code.length; i++) {
      int idx = i-1;
      if(i%4==0) {
        formattedCode += '${code[idx]} ';
      }else{
        formattedCode += code[idx];
      }
    }
    return formattedCode;
  }
}

class NFCECodeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String old = oldValue.text.replaceAll(' ', '');
    if (old.length >= newValue.text.length) {
      return newValue;
    }
    var cardText = addSeparators(newValue.text, ' ');
    return newValue.copyWith(text: cardText, selection: updateCursorPosition(cardText));
  }
  String addSeparators(String value, String separator) {
    value = value.replaceAll(' ', '');
    int aux = 3;
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == aux && i < 43) {
        newString += separator;
        aux += 4;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

// class NFCECodeTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     String old = oldValue.text.replaceAll(' ', '');
//     if (old.length >= newValue.text.length) {
//       return newValue;
//     }
//     final cardText = FormatterScannerUtil.formatNumericCode(newValue.text);
//     return newValue.copyWith(text: cardText, selection: updateCursorPosition(cardText));
//   }
//
//   TextSelection updateCursorPosition(String text) {
//     return TextSelection.fromPosition(TextPosition(offset: text.length));
//   }
// }