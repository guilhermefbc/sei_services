import 'package:flutter/material.dart';

class BaseDialog extends StatefulWidget {
  static const double padding = 10;
  static const double iconRadius = 40;
  static const double iconSize = 50;
  static const double defaultTitleSize = 22;
  static const double defaultDescriptionSize = 14;

  final Widget child;
  final IconData icon;
  final Color backgroundIconColor;

  const BaseDialog({
    Key? key,
    required this.child,
    required this.icon,
    required this.backgroundIconColor,
  }) : super(key: key);

  @override
  State<BaseDialog> createState() => _BaseDialogState();
}

class _BaseDialogState extends State<BaseDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BaseDialog.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Material(
        child: ScaleTransition(
          scale: scaleAnimation,
          child: contentBox(context),
        ),
        color: Colors.transparent,
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: _DialogClipper(iconSize: BaseDialog.iconSize),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              left: BaseDialog.padding,
              top: BaseDialog.iconRadius + BaseDialog.padding,
              right: BaseDialog.padding,
              bottom: BaseDialog.padding,
            ),
            margin: const EdgeInsets.only(top: BaseDialog.iconRadius),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(BaseDialog.padding),
            ),
            child: Padding(
              child: widget.child,
              padding: const EdgeInsets.all(BaseDialog.padding),
            ),
          ),
        ),
        Positioned(
          left: BaseDialog.padding,
          right: BaseDialog.padding,
          child: CircleAvatar(
            backgroundColor: widget.backgroundIconColor,
            radius: BaseDialog.iconRadius,
            child: Icon(
              widget.icon,
              size: BaseDialog.iconSize,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _DialogClipper extends CustomClipper<Path> {
  final num iconSize;

  _DialogClipper({
    required this.iconSize
  });

  @override
  getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final halfSpace = iconSize * 0.90;
    final curve = iconSize * -0.35;
    final height = iconSize * 1.73;

    path.lineTo(halfWidth - halfSpace, 0);
    path.cubicTo(halfWidth - halfSpace, 0, halfWidth - halfSpace + curve,
        height, halfWidth, height);

    path.cubicTo(halfWidth, height, halfWidth + halfSpace - curve, height,
        halfWidth + halfSpace, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}