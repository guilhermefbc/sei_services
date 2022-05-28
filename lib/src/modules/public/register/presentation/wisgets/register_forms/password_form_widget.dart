import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/login/presentation/widgets/password_icon_button_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
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
  final RegisterController _registerController = Modular.get<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Observer(
              builder: (_) => FormBuilderTextField(
                name: 'Password',
                decoration: InputDecoration(
                  labelText: 'password'.i18n(),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: PasswordIconButton(
                    icon1: const Icon(Icons.remove_red_eye),
                    icon2: const Icon(Icons.remove_red_eye_outlined),
                    function: _registerController.togglePasswordVisibility,
                    onTapIcon: _registerController.passwordVisible,
                  ),
                ),
                onChanged: _registerController.setPassword,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
                  FormBuilderValidators.minLength(8, errorText: 'thePasswordMustHaveMinLength'.i18n()),
                ]),
                keyboardType: TextInputType.text,
                obscureText: _registerController.passwordVisible,
              ),
              name: 'Register password',
            ),
            const SizedBox(height: 20,),
            Observer(
              builder: (_) => FormBuilderTextField(
                name: 'Confirm Password',
                decoration: InputDecoration(
                  labelText: 'confirmPassword'.i18n(),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: PasswordIconButton(
                    icon1: const Icon(Icons.remove_red_eye),
                    icon2: const Icon(Icons.remove_red_eye_outlined),
                    function: _registerController.togglePasswordVisibility,
                    onTapIcon: _registerController.passwordVisible,
                  ),
                ),
                onChanged: _registerController.setConfirmPassword,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
                  FormBuilderValidators.minLength(8, errorText: 'thePasswordMustHaveMinLength'.i18n()),
                ]),
                keyboardType: TextInputType.text,
                obscureText: _registerController.passwordVisible,
              ),
              name: 'Register password',
            ),
          ],
        ),
      ),
    );
  }
}
