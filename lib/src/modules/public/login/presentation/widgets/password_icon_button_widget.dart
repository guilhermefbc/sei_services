import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordIconButton extends StatefulWidget {
  Function()? function;
  Widget? icon1;
  Widget? icon2;
  bool onTapIcon;

  PasswordIconButton({
    Key? key,
    @required this.function,
    @required this.icon1,
    this.icon2,
    this.onTapIcon = true
  }) : super(key: key);

  @override
  _PasswordIconButtonState createState() => _PasswordIconButtonState();
}

class _PasswordIconButtonState extends State<PasswordIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.onTapIcon ? widget.icon1 : widget.icon2,
      onTap: widget.function ,
    );
  }
}