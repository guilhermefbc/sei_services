import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      title: 'Sucesso!',
      description: 'Nota lida com sucesso! A nota está em processamento, em breve você poderá visualizar ela no app',
      questionNavigation: 'Você quer ler outra nota?',
      button1Title: 'Não',
      button2Title: 'Sim',
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
      title: 'Nota repetida',
      description: 'Essa nota fiscal já foi lida, ela já está em processamento ou disponível no app',
      buttonTitle: 'Certo',
      buttonOnPressed: (){},
    );
  }

  Widget _invalidState(BuildContext context) {
    return InfoDialog.confirm(
      context: context,
      title: 'Estado inválido',
      description: 'O sistema ainda não está disponível para o estado (UF) desta nota, guarde ela por enquanto, embreve você poderá adicioná-la ao app.',
      buttonTitle: 'Certo',
      buttonOnPressed: (){},
    );
  }

  Widget _default(BuildContext context) {
    return InfoDialog.confirm(
      context: context,
      title: 'Tente novamente',
      description: 'Houve algum problema na leitura da nota, por favor tente novamente',
      buttonTitle: 'Certo',
      buttonOnPressed: (){},
    );
  }
}
