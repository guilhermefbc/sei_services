import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/processing/presentation/controller/processing/processing_controller.dart';
import 'package:sei_services/src/modules/private/processing/presentation/widgets/items/processing_item.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';

class ProcessingListScreen extends StatefulWidget {
  final int index;
  const ProcessingListScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<ProcessingListScreen> createState() => _ProcessingListScreenState();
}

class _ProcessingListScreenState extends State<ProcessingListScreen> {
  final ProcessingRepository _processing = Modular.get<ProcessingRepository>();
  final TransactionController _tController =
  Modular.get<TransactionController>();
  final ProcessingController _pController =
  Modular.get<ProcessingController>();



  @override
  Widget build(BuildContext context) {
    _tController.tabIndex = widget.index;
    _pController.addAllProcessing(_processing.processing);
    return Observer(
      builder: (context) {
        List data = _pController.processing;
        if(data.isEmpty) {
          return const Center(child: CircularProgressIndicator(),);
        }
        return ListView.builder(
            padding: const EdgeInsets.only(top: 5, bottom: 15).r,
            itemCount: data.length,
            itemBuilder: (ctx, idx) => ProcessingItem(processing: data[idx])
        );
      },
    );
  }
}
