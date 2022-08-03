import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/formatter_scanner_util.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/scanner_util.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/controller/scanner_controller.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/widgets/dialogs/select_scanner_notificationDialog.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_decorated_box_widget.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';

class NumericCodeScreen extends StatefulWidget {
  const NumericCodeScreen({Key? key}) : super(key: key);

  @override
  State<NumericCodeScreen> createState() => _NumericCodeScreenState();
}

class _NumericCodeScreenState extends State<NumericCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final ScannerController _controller = Modular.get<ScannerController>();
  final ScannerUtil _scanner = Modular.get<ScannerUtil>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 20).r,
            children: [
              Center(
                child: RegisterDecoratedBoxWidget(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: FormBuilderTextField(
                            key: const ValueKey('scannerManualNumericCode'),
                            autofocus: true,
                            name: 'RegisterEmail',
                            decoration: const InputDecoration(
                              labelText: 'Manual code',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.numbers),
                            ),
                            onChanged: _controller.setCode,
                            maxLines: 2,
                            inputFormatters: [NFCECodeTextFormatter()],
                            maxLength: 54,
                            valueTransformer: (value) {
                              return value?.replaceAll(' ', '');
                            },
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'thisFieldIsRequired'.i18n()),
                              // FormBuilderValidators.max(44,
                              //     errorText: '44CharactersAreRequired'.i18n()),
                              // FormBuilderValidators.min(44,
                              //     errorText: '44CharactersAreRequired'.i18n()),
                            ]),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Observer(
                        builder: (context) {
                          return _controller.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SimpleButton(
                                  onPressed: () async {
                                    try{
                                      if (_formKey.currentState!.validate()) {
                                        _controller.loading = true;
                                        await _scanner.scanDoc(_controller.code);
                                        _controller.loading = false;
                                        await _showDialog(context);
                                      }
                                    }catch(_) {
                                      _controller.loading = false;
                                    }
                                  },
                                  title: 'Enviar',
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) =>
            SelectScannerNotificationDialog(status: _controller.status));
  }
}
