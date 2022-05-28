import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    //Set the fit size (fill in the screen size of the device in the design)
    //If the design is based on the size of the 360*690(dp)
    ScreenUtil.init(context, designSize: const Size(390, 780));

    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFB9FAFA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('dontHaveAnAccount'.i18n()),
            TextButton(
                onPressed: (){
                  Modular.to.pushNamed('/register');
                },
                child: Text('register'.i18n(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 160.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.r, right: 30.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'Email',
                    decoration: InputDecoration(
                      labelText: 'email'.i18n(),
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    onChanged: _loginController.setEmail,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
                      FormBuilderValidators.email(errorText: 'thisFieldMustBeAValidEmail'.i18n())
                    ]),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10.r,
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
                        FormBuilderValidators.required(errorText: 'thisFieldIsRequired'.i18n()),
                        FormBuilderValidators.minLength(8, errorText: 'thePasswordMustHaveMinLength'.i18n()),
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
      )
    );
  }
}
