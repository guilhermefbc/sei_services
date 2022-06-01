import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_decorated_box_widget.dart';

class NameFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const NameFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _NameFormWidgetState createState() => _NameFormWidgetState();
}

class _NameFormWidgetState extends State<NameFormWidget> {
  final RegisterController _registerController = Modular.get<RegisterController>();
  late FocusNode nameFocusNode;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    nameFocusNode.dispose();
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
              key: const ValueKey('Register First Name'),
              autofocus: true,
              onSubmitted: (_) => nameFocusNode.requestFocus(),
              initialValue: _registerController.firstName,
              name: 'First name',
              decoration: InputDecoration(
                labelText: 'firstName'.i18n(),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.edit),
              ),
              onChanged: _registerController.setFirstName,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
              ]),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 20.h,),
            FormBuilderTextField(
              key: const ValueKey('Register Last Name'),
              focusNode: nameFocusNode,
              initialValue: _registerController.lastName,
              name: 'Last name',
              decoration: InputDecoration(
                labelText: 'lastName'.i18n(),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.edit),
              ),
              onChanged: _registerController.setLastName,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
              ]),
              keyboardType: TextInputType.name,
            ),
          ],
        ),
      ),
    );
  }
}
