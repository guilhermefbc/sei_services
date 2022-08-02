import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProcessingHeaderWidget extends StatelessWidget {
  const ProcessingHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Em processamento',
        style: TextStyle(
            fontSize: 22.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
