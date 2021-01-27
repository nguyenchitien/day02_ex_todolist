import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';
import 'package:flutter_day2_ex/utils/callbacks.dart';
import 'package:flutter_day2_ex/utils/utils.dart';
import 'package:flutter_day2_ex/widget/rounded_checbox.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    Key key,
    @required this.task,
    @required this.onCompletedTaskCallback,
  }) : super(key: key);

  final TaskModel task;
  final CompletedTaskCallback onCompletedTaskCallback;

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isChecked;

  @override
  void initState() {
    super.initState();

    isChecked = widget.task.isCompleted;
  }

  void _onChecked() {
    setState(() {
      isChecked = !isChecked;
      widget.onCompletedTaskCallback(widget.task, isChecked);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = GlobalConfigurations.isDarkMode;

    // TODO: Need refactor colors with ThemData
    final textDecoration = isChecked ? TextDecoration.lineThrough : null;
    final backgroundColorDark = isChecked ? Colors.black26 : Colors.black;
    final backgroundColorLight = Colors.white;

    final borderColorLight =
        isChecked ? Colors.grey.withOpacity(0) : Colors.transparent;
    final borderColor = isDarkMode ? Colors.transparent : borderColorLight;

    var shadowColor;
    if (isDarkMode) {
      shadowColor = Colors.black.withOpacity(0.2);
    } else {
      shadowColor = isChecked
          ? Colors.grey.withOpacity(0.2)
          : Colors.black.withOpacity(0.25);
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? backgroundColorDark : backgroundColorLight,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: Offset(0.0, 1.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.task.title,
            style: TextStyle(fontSize: 16, decoration: textDecoration),
          ),
          RoundedCheckbox(value: isChecked, onChanged: _onChecked),
        ],
      ),
    );
  }
}
