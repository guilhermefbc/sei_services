import 'package:flutter/material.dart';

class ManualRegisterScreen extends StatefulWidget {
  const ManualRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ManualRegisterScreen> createState() => _ManualRegisterScreenState();
}

class _ManualRegisterScreenState extends State<ManualRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.green,
      ),
    );
  }
}
