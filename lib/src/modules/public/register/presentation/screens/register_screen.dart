import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/email_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/name_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/nickname_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/password_form_widget.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegisterController _registerController = Modular.get<RegisterController>();


  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context){
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_registerController.changeAppBarTitle),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.r),
            child: ListView(
              children: [
                IconStepper(
                  enableNextPreviousButtons: false,
                  enableStepTapping: false,
                  scrollingDisabled: false,
                  stepRadius: 20.r,
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
                  activeStep: _registerController.activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    _registerController.activeStep = index;
                  },
                ),
                SizedBox(height: 140.h,),
                <Widget>[
                  NameFormWidget(formKey: _formKey),
                  EmailFormWidget(formKey: _formKey),
                  PasswordFormWidget(formKey: _formKey),
                  NicknameFormWidget(formKey: _formKey),
                ][_registerController.activeStep],
                if([1,3].contains(_registerController.activeStep))
                  SizedBox(height: 90.h,),
                SizedBox(height: 160.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _previousButton(),
                    _nextButton(),
                  ],
                ),
              ],
            )
        ),
      );
    });
  }

  Widget _nextButton() {
    return SimpleButton(
      onPressed: () {
        if(_formKey.currentState!.validate()) {
          // Increment activeStep, when the next button is tapped. However, check for upper bound.
          if (_registerController.activeStep <= _registerController.upperBound) {
            _registerController.activeStep++;
          }
        }
      },
      title: 'next'.i18n(),
      width: 120,
    );
  }

  Widget _previousButton() {
    return SimpleButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (_registerController.activeStep > 0) {
          _registerController.activeStep--;
        }
      },
      title: 'prev'.i18n(),
      width: 120,
    );
  }
}
