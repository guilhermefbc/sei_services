import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
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
  final TransactionController _controller =
  Modular.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    _controller.tabIndex = widget.index;
    List data = _processing.processing;
    return ListView.builder(
        padding: const EdgeInsets.only(top: 5).r,
        itemCount: data.length,
        itemBuilder: (ctx, idx) => ProcessingItem(processing: data[idx])
    );
  }
}
