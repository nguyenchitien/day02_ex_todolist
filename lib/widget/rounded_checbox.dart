import 'package:flutter/material.dart';

class RoundedCheckbox extends StatelessWidget {
  final bool value;
  final Function onChanged;

  const RoundedCheckbox({Key key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: !value
              ? Border.all(color: Colors.white)
              : Border.all(color: Colors.transparent),
          color: value ? Colors.deepOrangeAccent : null,
        ),
        child: Container(
          width: 25,
          height: 25,
          child: value
              ? Icon(
                  Icons.check,
                  size: 14.0,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }
}
