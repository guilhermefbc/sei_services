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
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          actions: [
            IconButton(
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
            IconButton(
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: Stack(
          children: [
            MobileScanner(
                allowDuplicates: false,
                controller: cameraController,
                onDetect: (barcode, args) {
                  print(barcode.rawValue);
                  print(barcode.format);
                  print(barcode.type);
                  _scanner.scanDoc(barcode.rawValue).then((_) {
                    _showDialog(context);
                  });
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
            )
          ],
        ));
  }

  _showDialog(BuildContext context) {
    print(_controller.status.toString());
    showDialog(
        context: context,
        builder: (ctx) => SelectScannerNotificationDialog(status: _controller.status)
    );
  }
}
