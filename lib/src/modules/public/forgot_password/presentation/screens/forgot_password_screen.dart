import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/login/presentation/controller/login/login_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){}, child: Text('forgotPassword'.i18n()))
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          // Modular.to.navigate('/private');
                          print("Email de recuperação enviado!");
                        }
                      },
                      child: Text('send'.i18n())
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
