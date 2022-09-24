import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:im_stepper/stepper.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/home/presentation/controllers/menu_controller/menu_controller.dart';
import 'package:sei_services/src/modules/private/manual/presentation/controllers/register_controller/purchase_register_controller.dart';
import 'package:sei_services/src/modules/private/manual/presentation/widgets/register_forms/purchase_form_widget.dart';
import 'package:sei_services/src/shared/presentation/widgets/button/simple_button.dart';

class ManualRegisterScreen extends StatefulWidget {
  const ManualRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ManualRegisterScreen> createState() => _ManualRegisterScreenState();
}

class _ManualRegisterScreenState extends State<ManualRegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final PurchaseRegisterController _rController = Modular.get<PurchaseRegisterController>();
  final List<String> _titles = <String>[
    'Dados da compra',
    'Data'
  ];

  final MenuController _menuController = Modular.get<MenuController>();


  @override
  void initState() {
    super.initState();
    _menuController.toggleIsActive();
  }

  @override
  void dispose() {
    _menuController.toggleIsActive();
    super.dispose();
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
        Icon(Icons.add_shopping_cart_outlined),
        Icon(Icons.calendar_today),
        // Icon(Icons.check_circle),
      ],

      // activeStep property set to activeStep variable defined above.
      activeStep: _rController.activeStep,

      // This ensures step-tapping updates the activeStep.
      onStepReached: (index) {
        _rController.activeStep = index;
      },
    );
  }

  Widget _buildTextualField() {
    return <Widget>[
      PurchaseFormWidget(formKey: _formKey),
    ][_rController.activeStep];
  }

  Widget _defineButtonArea(BuildContext context) {
    if(_rController.isLoading) {
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
    if (_rController.activeStep <= _rController.upperBound) {
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
        _rController.activeStep++;
      }
    };
  }

  _concludeAction(BuildContext context) {
    return () async {
      // _rController.toggleIsLoading();
      // bool result = await _sendRegistrationData();
      // _controller.toggleIsLoading();
      // if(result) {
      //   _successDialog(context);
      // }else{
      //   _somethingWentWrongDialog(context);
      // }
    };
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
      if (_rController.activeStep > 0) {
        _rController.activeStep--;
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (context) {
            return Text(_titles[_rController.activeStep]);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8).r,
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
        ),
      ),
    );
  }
}
