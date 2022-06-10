import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/register/domain/repositories/register_repository.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_forms/email_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_forms/name_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_forms/nickname_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_forms/password_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_forms/resume_form_widget.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/info_dialog.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/success_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegisterController _controller = Modular.get<RegisterController>();
  final RegisterRepository _repository = Modular.get<RegisterRepository>();
  final List<String> _titles = <String>[
    'name'.i18n(),
    'email'.i18n(),
    'password'.i18n(),
    'nickname'.i18n(),
    'summary'.i18n()
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_titles[_controller.activeStep]),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.r),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 0.85.sh,
                child: Column(
                  children: [
                    _buildIconStepper(),
                    const Spacer(),
                    _buildTextualField(),
                    const Spacer(),
                    _defineButtonArea(context)
                  ],
                ),
              ),
            )),
      );
    });
  }

  Widget _buildTextualField() {
    return <Widget>[
      NameFormWidget(formKey: _formKey),
      EmailFormWidget(formKey: _formKey),
      PasswordFormWidget(formKey: _formKey),
      NicknameFormWidget(formKey: _formKey),
      const ResumeFormWidget(
        key: ValueKey('ResumeFormWidgetKey'),
      )
    ][_controller.activeStep];
  }

  Widget _buildIconStepper() {
    return IconStepper(
      enableNextPreviousButtons: false,
      enableStepTapping: false,
      scrollingDisabled: false,
      stepRadius: 25.r,
      activeStepBorderColor: Colors.blueAccent,
      activeStepColor: Colors.blueAccent,
      icons: const [
        Icon(Icons.edit),
        Icon(Icons.email_outlined),
        Icon(Icons.password),
        Icon(Icons.person),
        Icon(Icons.check_circle),
      ],

      // activeStep property set to activeStep variable defined above.
      activeStep: _controller.activeStep,

      // This ensures step-tapping updates the activeStep.
      onStepReached: (index) {
        _controller.activeStep = index;
      },
    );
  }

  Widget _defineButtonArea(BuildContext context) {
    if(_controller.isLoading) {
      return const LinearProgressIndicator(minHeight: 2,);
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _previousButton(),
          _nextButton(context),
        ],
      );
    }
  }

  Widget _nextButton(BuildContext context) {
    if (_controller.activeStep <= _controller.upperBound) {
      return SimpleButton(
        onPressed: _nextAction(),
        title: 'next'.i18n(),
        width: 120.w,
      );
    } else {
      return SimpleButton(
        onPressed: _concludeAction(context),
        title: 'conclude'.i18n(),
        width: 120.w,
        color: Colors.green,
      );
    }
  }

  _nextAction() {
    return () {
      if (_formKey.currentState!.validate()) {
        _controller.activeStep++;
      }
    };
  }

  _concludeAction(BuildContext context) {
    return () async {
      _controller.toggleIsLoading();
      bool result = await _sendRegistrationData();
      _controller.toggleIsLoading();
      if(result) {
        _successDialog(context);
      }else{
        _somethingWentWrongDialog(context);
      }
    };
  }

  Future<bool> _sendRegistrationData() async {
    return await _repository.createUser(
        email: _controller.email!,
        firstname: _controller.firstname!,
        lastName: _controller.lastname!,
        nickname: _controller.nickname!,
        password: _controller.password!);
  }

  Widget _previousButton() {
    return SimpleButton(
      onPressed: _previousAction(),
      title: 'prev'.i18n(),
      width: 120.w,
    );
  }

  _previousAction() {
    return () {
      if (_controller.activeStep > 0) {
        _controller.activeStep--;
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
            description: 'registerSuccess'.i18n(),
            buttonTitle: 'goToLogin'.i18n(),
            buttonOnPressed: () {
              Modular.to.navigate('/login/');
            }
        )
    );
  }

  _somethingWentWrongDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => InfoDialog.confirm(
            context: ctx,
            title: 'registerWithProblems'.i18n(),
            description: 'registerWithProblemsMessage'.i18n(),
            buttonTitle: 'ok'.i18n(),
            buttonOnPressed: (){}
        )
    );
  }
}
