import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/scanner_util.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/controller/scanner_controller.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/widgets/dialogs/scanner_notiifcation_dialog.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/widgets/dialogs/select_scanner_notificationDialog.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  final ScannerUtil _scanner = Modular.get<ScannerUtil>();
  final ScannerController _controller = Modular.get<ScannerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) async {
              await _scanner.scanDoc(barcode.rawValue);
              await _showDialog(context);
            }),
        Center(
          child: Container(
            height: 250.r,
            width: 250.r,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 4,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15.r,
          right: 15.r,
          child: GestureDetector(
            onTap: () {
              Modular.to.pushNamed('/private/scanner/manual_numeric_code');
            },
            child: CircleAvatar(
              radius: 30.r,
              child: Text(
                '123',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15.r,
          left: 15.r,
          child: GestureDetector(
            onTap: () {
              Modular.to.pushNamed('/private/scanner/manual_numeric_code');
            },
            child: CircleAvatar(
              radius: 30.r,
              child: IconButton(
                color: Colors.white,
                icon: ValueListenableBuilder(
                  valueListenable: cameraController.torchState,
                  builder: (context, state, child) {
                    switch (state as TorchState) {
                      case TorchState.off:
                        return const Icon(Icons.flash_off, color: Colors.grey);
                      case TorchState.on:
                        return const Icon(Icons.flash_on, color: Colors.yellow);
                    }
                  },
                ),
                iconSize: 32.0,
                onPressed: () => cameraController.toggleTorch(),
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) =>
          SelectScannerNotificationDialog(status: _controller.status),
    );
  }
}
