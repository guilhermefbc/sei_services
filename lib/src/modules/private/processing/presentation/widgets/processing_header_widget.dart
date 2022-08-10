import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';

class ProcessingHeaderWidget extends StatelessWidget {
  const ProcessingHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'processing'.i18n(),
        style: TextStyle(
            fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
