import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/base_dialog.dart';

class DeleteDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final Function() buttonOnPressed1;
  final Function() buttonOnPressed2;
  const DeleteDialog({
    Key? key,
    this.title,
    this.description,
    required this.buttonOnPressed1,
    required this.buttonOnPressed2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
        icon: Icons.delete,
        backgroundIconColor: Colors.redAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? 'deleteItem'.i18n(),
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              description ?? 'deleteItemDescription'.i18n(),
              style: const TextStyle(
                  fontSize: 18
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleButton(
                  title: 'no'.i18n(),
                  onPressed: () async {
                    await buttonOnPressed1();
                    Navigator.of(context).pop(false);
                  },
                ),
                SimpleButton(
                  title: 'yes'.i18n(),
                  onPressed: () async {
                    await buttonOnPressed2();
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            )
          ],
        ),
    );
  }
}
