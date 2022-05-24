import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailFormBuilderTextField extends StatefulWidget {
  final controller;
  const EmailFormBuilderTextField({
     Key? key,
     required this.controller
     }) : super(key: key);

  @override
  State<EmailFormBuilderTextField> createState() => _EmailFormBuilderTextFieldState();
}

class _EmailFormBuilderTextFieldState extends State<EmailFormBuilderTextField> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        name: 'Email',
        decoration: const InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email_outlined),
        ),
        onChanged: widget.controller.setEmail, 
        // valueTransformer: (text) => num.tryParse(text),
        // autovalidateMode: AutovalidateMode.always,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'This field is required'),
          FormBuilderValidators.email(errorText: 'This fiel must be a valid email')
        ]),
        keyboardType: TextInputType.emailAddress,
    );
  }
}