import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import '../controller/login/login_controller.dart';
import '../widgets/password_icon_button_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Modular.get<LoginController>();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Form(
              key: _formKey,
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
                    // autovalidateMode: AutovalidateMode.always,
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
                        labelText: 'password'.i18n(),
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
                      // autovalidateMode: AutovalidateMode.always,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText: 'This field is required'),
                        FormBuilderValidators.numeric(errorText: 'The age is a numeric value'),
                        FormBuilderValidators.minLength(8, errorText: 'The password must have min length 8'),
                      ]),
                      keyboardType: TextInputType.text,
                      obscureText: _loginController.passwordVisible,
                    ),
                    name: 'Login password',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){
                            Modular.to.pushNamed('/forgot_password');
                          },
                          child: Text('forgotPassword'.i18n())
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          Modular.to.navigate('/private');
                        }
                      },
                      child: Text('login'.i18n())
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
