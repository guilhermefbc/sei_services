import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/processing/presentation/widgets/items/processing_item.dart';

class ProcessingListScreen extends StatefulWidget {
  const ProcessingListScreen({Key? key}) : super(key: key);

  @override
  State<ProcessingListScreen> createState() => _ProcessingListScreenState();
}

class _ProcessingListScreenState extends State<ProcessingListScreen> {
  final ProcessingRepository _processing = Modular.get<ProcessingRepository>();

  @override
  Widget build(BuildContext context) {
    List data = _processing.processing;
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, idx) => ProcessingItem(processing: data[idx])
    );
  }
}
