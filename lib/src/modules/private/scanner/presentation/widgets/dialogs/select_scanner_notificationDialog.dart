import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/scanner/domain/enum/scanner_status_enum.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/widgets/dialogs/scanner_notiifcation_dialog.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/info_dialog.dart';

class SelectScannerNotificationDialog extends StatefulWidget {
  final ScannerStatusEnum status;
  const SelectScannerNotificationDialog({Key? key, required this.status}) : super(key: key);

  @override
  State<SelectScannerNotificationDialog> createState() => _SelectScannerNotificationDialogState();
}

class _SelectScannerNotificationDialogState extends State<SelectScannerNotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return _getSelectedDialog(context);
  }

  Widget _getSelectedDialog(BuildContext context) {
    switch(widget.status) {
      case ScannerStatusEnum.success:
        return _success(context);
      case ScannerStatusEnum.repeated:
        return _repeated(context);
      case ScannerStatusEnum.invalidState:
        return _invalidState(context);
      default:
        return _default(context);
    }
  }

  Widget _success(BuildContext context) {
    return ScannerNotificationDialog(
      title: 'success'.i18n() + '!',
      description: 'noteReadSuccessfully'.i18n(),
      questionNavigation: 'readAnotherNote'.i18n(),
      button1Title: 'no'.i18n(),
      button2Title: 'yes'.i18n(),
      button1OnPressed: () {
        Modular.to.navigate('/private/transaction/');
        Modular.to.pop();
      },
      button2OnPressed: () {
        Modular.to.pop();
      },
    );
  }

  Widget _repeated(BuildContext context) {
    return InfoDialog.confirm(
      context: context,
      title: 'repeatedNote'.i18n(),
      description: 'hasAlreadyBeenRead'.i18n(),
      buttonTitle: 'right'.i18n(),
      buttonOnPressed: (){},
    );
  }

  Widget _invalidState(BuildContext context) {
    return InfoDialog.confirm(
      context: context,
      title: 'invalidState'.i18n(),
      description: 'invalidStateMessage'.i18n(),
      buttonTitle: 'right'.i18n(),
      buttonOnPressed: (){},
    );
  }

  Widget _default(BuildContext context) {
    return InfoDialog.confirm(
      context: context,
      title: 'tryAgain'.i18n(),
      description: 'tryAgainMessage'.i18n(),
      buttonTitle: 'right'.i18n(),
      buttonOnPressed: (){},
    );
  }
}
