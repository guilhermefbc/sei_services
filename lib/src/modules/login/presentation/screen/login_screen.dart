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
                Observer(
                    builder: (_) => FormBuilderTextField(
                      name: 'Email',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      onChanged: _loginController.setEmail,
                      // valueTransformer: (text) => num.tryParse(text),
                      // validator: FormBuilderValidators.compose([
                      //   FormBuilderValidators.required(context),
                      //   FormBuilderValidators.numeric(context),
                      //   FormBuilderValidators.max(context, 70),
                      // ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Observer(
                //   builder: (_) => FormBuilderTextField(
                //     name: 'Senha',
                //     decoration: InputDecoration(
                //       labelText: 'Senha',
                //       border: const OutlineInputBorder(),
                //       prefixIcon: const Icon(Icons.password),
                //       suffixIcon: PasswordIconButton(
                //         icon1: const Icon(Icons.remove_red_eye),
                //         icon2: const Icon(Icons.email_outlined),
                //         function: _loginController.togglePasswordVisibility,
                //       ),
                //     ),
                //     onChanged: _loginController.setPassword,
                //     // valueTransformer: (text) => num.tryParse(text),
                //     // validator: FormBuilderValidators.compose([
                //     //   FormBuilderValidators.required(context),
                //     //   FormBuilderValidators.numeric(context),
                //     //   FormBuilderValidators.max(context, 70),
                //     // ]),
                //     keyboardType: TextInputType.text,
                //     obscureText: true,
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
