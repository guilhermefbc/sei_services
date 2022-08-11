import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/processing/presentation/controller/processing/processing_controller.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/delete_dialog.dart';
import 'package:sei_services/src/shared/theme/items_shadow.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/formatter_scanner_util.dart';

class ProcessingItem extends StatelessWidget {
  final ProcessingEntity processing;
  ProcessingItem({Key? key, required this.processing}) : super(key: key);
  final ProcessingRepository _repository = Modular.get<ProcessingRepository>();
  final ProcessingController _controller = Modular.get<ProcessingController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showDeleteDialog(context);
      },
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
            Text(
              'noteCode'.i18n(),
              style: const TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Text(
              FormatterScannerUtil.formatNumericCode(processing.code),
              textAlign: TextAlign.center,
            ),
            Text(
              'readingDate'.i18n(),
              style: const TextStyle(fontWeight: FontWeight.w600),
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

  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DeleteDialog(
              buttonOnPressed1: (){},
              buttonOnPressed2: () {
                _controller.removeProcessing(processing);
                _repository.deleteProcessing(processing.code);
              }
          );
        }
    );
  }
}
