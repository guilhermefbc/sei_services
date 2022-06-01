import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_decorated_box_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              key: const ValueKey('Register Nickname'),
              name: 'Nickname',
              decoration: const InputDecoration(
                labelText: 'Nickname',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              // onChanged: _loginController.setEmail,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'This field is required'),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
