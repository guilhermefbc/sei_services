import 'package:flutter/material.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/base_dialog.dart';

class SuccessDialog extends BaseDialog {
  const SuccessDialog({
    Key? key,
    required Widget child,
  }) : super(
    key: key,
    child: child,
    icon: Icons.check_circle,
    backgroundIconColor: Colors.green,
  );

  SuccessDialog.confirm({
    Key? key,
    required BuildContext context,
    required String title,
    required String description,
    required String buttonTitle,
    required Function buttonOnPressed,
  }) : super(
    key: key,
    child: defaultInfo(
      context,
      title,
      description,
      buttonTitle,
      buttonOnPressed,
    ),
    icon: Icons.check_circle,
    backgroundIconColor: Colors.green,
  );

  static Widget defaultInfo(
      BuildContext context,
      String title,
      String description,
      String buttonTitle,
      Function buttonOnPressed,
      ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          description,
          style: const TextStyle(
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 22,
        ),
        SimpleButton(
            title: buttonTitle,
            onPressed: () async {
              await buttonOnPressed();
            },
        )
      ],
    );
  }
}