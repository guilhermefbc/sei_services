import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_decorated_box_widget.dart';

class NicknameFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const NicknameFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _NicknameFormWidgetState createState() => _NicknameFormWidgetState();
}

class _NicknameFormWidgetState extends State<NicknameFormWidget> {
  final RegisterController _register = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: const ValueKey('Register Nickname'),
              autofocus: true,
              initialValue: _register.nickname,
              name: 'nickname'.i18n(),
              decoration: const InputDecoration(
                labelText: 'Nickname',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onChanged: _register.setNickname,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
