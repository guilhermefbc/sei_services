import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/app_initial_widget.dart';
import 'package:sei_services/src/app_module.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppInitialWidget()));
}

