import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/manual/presentation/controllers/register_controller/purchase_register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_decorated_box_widget.dart';

class PurchaseFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PurchaseFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _PurchaseFormWidgetState createState() => _PurchaseFormWidgetState();
}

class _PurchaseFormWidgetState extends State<PurchaseFormWidget> {
  final PurchaseRegisterController _rController = Modular.get<PurchaseRegisterController>();
  late FocusNode purchaseFocusNode;

  @override
  void initState() {
    super.initState();
    purchaseFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    purchaseFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: const ValueKey('Register Store Name'),
              autofocus: true,
              onSubmitted: (_) => purchaseFocusNode.requestFocus(),
              initialValue: _rController.storeName,
              name: 'Store name',
              decoration: InputDecoration(
                labelText: 'storeName'.i18n(),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.edit),
              ),
              onChanged: _rController.setStoreName,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
              ]),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 20.h,),
            FormBuilderTextField(
              key: const ValueKey('Register Last Name'),
              focusNode: purchaseFocusNode,
              initialValue: _rController.getFormattedAmount(),
              name: 'Purchase Amount',
              decoration: InputDecoration(
                labelText: 'purchaseAmount'.i18n(),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.edit),
              ),
              onChanged: _rController.setAmount,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
              ]),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
