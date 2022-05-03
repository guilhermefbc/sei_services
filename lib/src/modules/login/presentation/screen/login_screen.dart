import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sei_services/src/modules/login/presentation/controller/login/login_controller.dart';
import 'package:sei_services/src/modules/login/presentation/widgets/password_icon_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'Email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  onChanged: _loginController.setEmail,
                  // valueTransformer: (text) => num.tryParse(text),
                  autovalidateMode: AutovalidateMode.always,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'This field is required'),
                    FormBuilderValidators.email(errorText: 'This fiel must be a valid email')
                  ]),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                Observer(
                  builder: (_) => FormBuilderTextField(
                    name: 'Senha',
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: PasswordIconButton(
                        icon1: const Icon(Icons.remove_red_eye),
                        icon2: const Icon(Icons.remove_red_eye_outlined),
                        function: _loginController.togglePasswordVisibility,
                        onTapIcon: _loginController.passwordVisible,
                      ),
                    ),
                    onChanged: _loginController.setPassword,
                    // valueTransformer: (text) => num.tryParse(text),
                    autovalidateMode: AutovalidateMode.always,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'This field is required'),
                      FormBuilderValidators.numeric(errorText: 'The age is a numeric value'),
                      FormBuilderValidators.minLength(8, errorText: 'The password must have min length 8')
                    ]),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                Observer(
                    builder: (_) => Text('Nome: ' + _loginController.email.toString())
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
