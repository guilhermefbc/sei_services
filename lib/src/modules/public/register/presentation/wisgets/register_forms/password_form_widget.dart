import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/login/presentation/widgets/password_icon_button_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_decorated_box_widget.dart';

class PasswordFormWidget extends StatefulWidget {
  final GlobalKey formKey;
  const PasswordFormWidget({
    Key? key,
    required this.formKey
  }) : super(key: key);

  @override
  _PasswordFormWidgetState createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Observer(
              builder: (_) => FormBuilderTextField(
                name: 'Senha',
                decoration: InputDecoration(
                  labelText: 'password'.i18n(),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: PasswordIconButton(
                    icon1: const Icon(Icons.remove_red_eye),
                    icon2: const Icon(Icons.remove_red_eye_outlined),
                    // function: _loginController.togglePasswordVisibility,
                    // onTapIcon: _loginController.passwordVisible,
                  ),
                ),
                // onChanged: _loginController.setPassword,
                // valueTransformer: (text) => num.tryParse(text),
                // autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'This field is required'),
                  FormBuilderValidators.minLength(8, errorText: 'The password must have min length 8'),
                ]),
                keyboardType: TextInputType.text,
                // obscureText: _loginController.passwordVisible,
              ),
              name: 'Login password',
            ),
            const SizedBox(height: 20,),
            Observer(
              builder: (_) => FormBuilderTextField(
                name: 'Senha',
                decoration: InputDecoration(
                  labelText: 'password'.i18n(),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: PasswordIconButton(
                    icon1: const Icon(Icons.remove_red_eye),
                    icon2: const Icon(Icons.remove_red_eye_outlined),
                    // function: _loginController.togglePasswordVisibility,
                    // onTapIcon: _loginController.passwordVisible,
                  ),
                ),
                // onChanged: _loginController.setPassword,
                // valueTransformer: (text) => num.tryParse(text),
                // autovalidateMode: AutovalidateMode.always,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'This field is required'),
                  FormBuilderValidators.minLength(8, errorText: 'The password must have min length 8'),
                ]),
                keyboardType: TextInputType.text,
                // obscureText: _loginController.passwordVisible,
              ),
              name: 'Login password',
            ),
          ],
        ),
      ),
    );
  }
}
