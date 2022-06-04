import 'package:flutter/material.dart';

class RegisterDecoratedBoxWidget extends StatefulWidget {
  final Widget child;
  const RegisterDecoratedBoxWidget({
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  _RegisterDecoratedBoxWidgetState createState() => _RegisterDecoratedBoxWidgetState();
}

class _RegisterDecoratedBoxWidgetState extends State<RegisterDecoratedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10),),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: widget.child,
      ),
    );
  }
}
