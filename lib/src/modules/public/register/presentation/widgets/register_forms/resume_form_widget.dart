import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/widgets/register_decorated_box_widget.dart';
import 'package:sei_services/src/shared/theme/text_colors_theme.dart';

class ResumeFormWidget extends StatefulWidget {
  const ResumeFormWidget({Key? key}) : super(key: key);

  @override
  State<ResumeFormWidget> createState() => _ResumeFormWidgetState();
}

class _ResumeFormWidgetState extends State<ResumeFormWidget> {
  final RegisterController _register = Modular.get<RegisterController>();

  Widget _getUserInfo(String field, String value) {
    TextStyle fieldStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp, color: TextColorTheme.textInfoColor1);
    TextStyle valueStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp, color: TextColorTheme.textInfoColor2);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2).r,
      child: Column(
        children: [
          Text(field + ':', style: fieldStyle, overflow: TextOverflow.ellipsis),
          Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Text(value, style: valueStyle, overflow: TextOverflow.ellipsis),
          )
        ],
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      'resumeOfRegister'.i18n(), textAlign: TextAlign.center,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
          color: TextColorTheme.textTitleColor
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RegisterDecoratedBoxWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getTitle(),
            _getUserInfo('firstName'.i18n(), _register.firstname!),
            _getUserInfo('lastName'.i18n(), _register.lastname!),
            _getUserInfo('email'.i18n(), _register.email!),
            _getUserInfo('nickname'.i18n(), _register.nickname!),
          ],
        )
    );
  }
}
