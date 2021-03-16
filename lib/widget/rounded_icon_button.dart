import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Color backgroundColor;
  final Icon icon;
  final EdgeInsets padding;

  const RoundedIconButton({
    Key key,
    this.onPressed,
    this.color,
    this.icon,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 0,
      minWidth: 0,
      onPressed: onPressed,
      shape: CircleBorder(),
      padding: EdgeInsets.zero,
      color: color,
      // splashColor: Colors.redAccent,
      child: Container(
        padding: padding,
        color: backgroundColor,
        child: icon,
      ),
    );
  }
}
