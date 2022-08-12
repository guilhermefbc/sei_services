import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/app_initial_widget.dart';
import 'package:sei_services/src/app_module.dart';

void main() async {

  // Init screen util
  await ScreenUtil.ensureScreenSize();

  // Load dotenv
  await dotenv.load(fileName: "env/elements.env");

  return runApp(ModularApp(module: AppModule(), child: AppInitialWidget()));
}

