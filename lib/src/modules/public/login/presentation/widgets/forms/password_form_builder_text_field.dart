import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sei_services/src/modules/public/login/presentation/widgets/password_icon_button_widget.dart';

class PasswordFormBuilderTextFiel extends StatefulWidget {
  final controller;
  const PasswordFormBuilderTextFiel({
     Key? key,
     required this.controller 
     }) : super(key: key);

  @override
  State<PasswordFormBuilderTextFiel> createState() => _PasswordFormBuilderTextFielState();
}

class _PasswordFormBuilderTextFielState extends State<PasswordFormBuilderTextFiel> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
        name: 'Senha',
        decoration: InputDecoration(
          labelText: 'Senha',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.password),
          suffixIcon: PasswordIconButton(
            icon1: const Icon(Icons.remove_red_eye),
            icon2: const Icon(Icons.remove_red_eye_outlined),
            function: widget.controller.togglePasswordVisibility,
            onTapIcon: widget.controller.passwordVisible,
          ),
        ),
        onChanged: widget.controller.setPassword,
        // valueTransformer: (text) => num.tryParse(text),
        // autovalidateMode: AutovalidateMode.always,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'This field is required'),
          FormBuilderValidators.numeric(errorText: 'The age is a numeric value'),
          FormBuilderValidators.minLength(8, errorText: 'The password must have min length 8'),
        ]),
        keyboardType: TextInputType.text,
        obscureText: widget.controller.passwordVisible,
      );
  }
}