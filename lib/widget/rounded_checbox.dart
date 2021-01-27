import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';

class RoundedCheckbox extends StatelessWidget {
  final bool value;
  final Function onChanged;

  const RoundedCheckbox({Key key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = GlobalConfigurations.isDarkMode;

    final borderColorDark = !value ? Colors.white : Colors.deepOrangeAccent;
    final borderColorLight = !value ? Colors.black : Colors.lightBlue;
    final borderColor = isDarkMode ? borderColorDark : borderColorLight;

    final checkedBackground =
        isDarkMode ? Colors.deepOrangeAccent : Colors.lightBlue;

    return GestureDetector(
      onTap: onChanged,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
          color: value ? checkedBackground : null,
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
