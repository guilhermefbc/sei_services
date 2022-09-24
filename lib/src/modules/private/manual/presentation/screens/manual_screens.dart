import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class ManualScreens extends StatefulWidget {
  const ManualScreens({Key? key}) : super(key: key);

  @override
  State<ManualScreens> createState() => _ManualScreensState();
}

class _ManualScreensState extends State<ManualScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('manualPurchases'.i18n()),
      ),
    );
  }
}
