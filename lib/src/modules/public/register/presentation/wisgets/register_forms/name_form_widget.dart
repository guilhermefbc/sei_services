import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_decorated_box_widget.dart';

class NameFormWidget extends StatefulWidget {
  final GlobalKey formKey;
  const NameFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _NameFormWidgetState createState() => _NameFormWidgetState();
}

class _NameFormWidgetState extends State<NameFormWidget> {
  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'First name',
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
              ),
              // onChanged: _loginController.setEmail,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'This field is required'),
              ]),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20,),
            FormBuilderTextField(
              name: 'Last name',
              decoration: const InputDecoration(
                labelText: 'Last Name',
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
