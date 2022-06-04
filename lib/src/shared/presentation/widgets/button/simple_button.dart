import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  final Function() onPressed;
  final String title;
  final double? width;
  final Color? color;
  const SimpleButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.width = 100,
    this.color
  }) : super(key: key);

  @override
  State<SimpleButton> createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
          color: widget.color ?? Colors.blueAccent,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ],
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: widget.onPressed,
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )),
      ),
    );
  }
}
