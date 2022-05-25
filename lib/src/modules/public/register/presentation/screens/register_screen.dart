import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_decorated_box_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/email_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/name_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/nickname_form_widget.dart';
import 'package:sei_services/src/modules/public/register/presentation/wisgets/register_forms/password_form_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Email'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconStepper(
                enableNextPreviousButtons: false,
                enableStepTapping: false,
                scrollingDisabled: false,
                stepRadius: 20,
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
                activeStep: activeStep,

                // This ensures step-tapping updates the activeStep.
                onStepReached: (index) {
                  setState(() {
                    activeStep = index;
                  });
                },
              ),
              const Spacer(),
              <Widget>[
                NameFormWidget(formKey: _formKey),
                EmailFormWidget(formKey: _formKey),
                PasswordFormWidget(formKey: _formKey),
                NicknameFormWidget(formKey: _formKey),

              ][activeStep],
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  previousButton(),
                  nextButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        if(_formKey.currentState!.validate()) {
          // Increment activeStep, when the next button is tapped. However, check for upper bound.
          if (activeStep <= upperBound) {
            setState(() {
              activeStep++;
            });
          }
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }
}
