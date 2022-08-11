import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/forgot_password/domain/usecases/forgot_password_usecase.dart';
import 'package:sei_services/src/modules/public/login/presentation/controller/login/login_controller.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/info_dialog.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/success_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Modular.get<LoginController>();
  final ForgotPasswordUsecase _usecase = Modular.get<ForgotPasswordUsecase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgotPassword'.i18n()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'EmailResetPassword',
                    initialValue: _loginController.email,
                    decoration: InputDecoration(
                      labelText: 'email'.i18n(),
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    onChanged: _loginController.setEmail,
                    // valueTransformer: (text) => num.tryParse(text),
                    // autovalidateMode: AutovalidateMode.always,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'thisFieldIsRequired'.i18n()),
                      FormBuilderValidators.email(
                          errorText: 'thisFieldMustBeAValidEmail'.i18n())
                    ]),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Observer(builder: (context) {
                    return !_loginController.loading
                        ? SimpleButton(
                            onPressed: sendResetEmailAction(context),
                            title: 'send'.i18n(),
                            width: 100.w,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Function() sendResetEmailAction(BuildContext context) {
    return () async {
      if (_formKey.currentState!.validate()) {
        _loginController.loading = true;
        bool result =
            await _usecase.resetPassword(email: _loginController.email!);
        _loginController.loading = false;
        if (result) {
          _successDialog(context);
        } else {
          _somethingWentWrongDialog(context);
        }
      }
    };
  }

  _successDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => SuccessDialog.confirm(
            context: ctx,
            title: 'success'.i18n(),
            description: 'forgotPasswordSuccess'.i18n(),
            buttonTitle: 'goToLogin'.i18n(),
            buttonOnPressed: () {
              Modular.to.navigate('/login/');
            }));
  }

  _somethingWentWrongDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => InfoDialog.confirm(
            context: ctx,
            title: 'forgotPasswordWithProblems'.i18n(),
            description: 'forgotPasswordWithProblemsMessage'.i18n(),
            buttonTitle: 'ok'.i18n(),
            buttonOnPressed: () {}));
  }
}
