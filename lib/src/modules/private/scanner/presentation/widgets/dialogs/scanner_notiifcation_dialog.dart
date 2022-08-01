import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/base_dialog.dart';

class ScannerNotificationDialog extends StatefulWidget {
  final String title;
  final String description;
  final String? questionNavigation;
  final String button1Title;
  final String button2Title;
  final Function()? button1OnPressed;
  final Function()? button2OnPressed;

  const ScannerNotificationDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.button1Title,
      required this.button2Title,
      this.button1OnPressed,
      this.button2OnPressed,
      this.questionNavigation})
      : super(key: key);

  @override
  State<ScannerNotificationDialog> createState() =>
      _ScannerNotificationDialogState();
}

class _ScannerNotificationDialogState extends State<ScannerNotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      icon: Icons.qr_code,
      backgroundIconColor: Colors.blueAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            widget.description,
            style: TextStyle(fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 22.h,
          ),
          if (widget.questionNavigation != null)
            Column(
              children: [
                Text(
                  widget.questionNavigation!,
                  style: TextStyle(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 22.h,
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SimpleButton(
                title: widget.button1Title,
                onPressed: widget.button1OnPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
              SimpleButton(
                title: widget.button2Title,
                onPressed: widget.button2OnPressed ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
            ],
          )
        ],
      ),
    );
  }
}
