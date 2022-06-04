import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_decorated_box_widget.dart';

class EmailFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const EmailFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _EmailFormWidgetState createState() => _EmailFormWidgetState();
}

class _EmailFormWidgetState extends State<EmailFormWidget> {
  final RegisterController _registerController = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: const ValueKey('RegisterEmail'),
              autofocus: true,
              initialValue: _registerController.email,
              name: 'RegisterEmail',
              decoration: InputDecoration(
                labelText: 'email'.i18n(),
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              onChanged: _registerController.setEmail,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
                FormBuilderValidators.email(errorText: 'thisFieldMustBeAValidEmail'.i18n())
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
