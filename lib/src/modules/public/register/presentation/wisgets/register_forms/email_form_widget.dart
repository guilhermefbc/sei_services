import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_decorated_box_widget.dart';

class EmailFormWidget extends StatefulWidget {
  final GlobalKey formKey;
  const EmailFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _EmailFormWidgetState createState() => _EmailFormWidgetState();
}

class _EmailFormWidgetState extends State<EmailFormWidget> {
  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'Email',
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              // onChanged: _loginController.setEmail,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'This field is required'),
                FormBuilderValidators.email(errorText: 'This fiel must be a valid email')
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}
