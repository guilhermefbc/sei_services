import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';
import 'package:sei_services/src/shared/theme/items_shadow.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/formatter_scanner_util.dart';

class ProcessingItem extends StatelessWidget {
  final ProcessingEntity processing;

  const ProcessingItem({Key? key, required this.processing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [ItemsBoxShadow.boxShadow]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Código da nota',
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              FormatterScannerUtil.formatNumericCode(processing.code),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Data de leitura',
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              DateUtil.format(processing.date),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
