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
    return Observer(builder: (context){
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
                    IconStepper(
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
                    ),
                    const Spacer(),
                    <Widget>[
                      NameFormWidget(formKey: _formKey),
                      EmailFormWidget(formKey: _formKey),
                      PasswordFormWidget(formKey: _formKey),
                      NicknameFormWidget(formKey: _formKey),
                      const ResumeFormWidget(key: ValueKey('ResumeFormWidgetKey'),)
                    ][_controller.activeStep],
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _previousButton(),
                        _nextButton(),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ),
      );
    });
  }

  Widget _nextButton() {
    if(_controller.activeStep <= _controller.upperBound) {
      return SimpleButton(
        onPressed: () {
          if(_formKey.currentState!.validate()) {
            _controller.activeStep++;
          }
        },
        title: 'next'.i18n(),
        width: 120.w,
      );
    }else {
      return SimpleButton(
          onPressed: () async{
            bool result = await _repository.createUser(
              email: _controller.email!,
              firstname: _controller.firstname!,
              lastName: _controller.lastname!,
              nickname: _controller.nickname!,
              password: _controller.password!
            );
          },
          title: 'conclude'.i18n(),
          width: 120.w,
          color: Colors.green,
      );
    }
  }

  Widget _previousButton() {
    return SimpleButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (_controller.activeStep > 0) {
          _controller.activeStep--;
        }
      },
      title: 'prev'.i18n(),
      width: 120.w,
    );
  }
}
