import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/bloc/exp_timer_bloc.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
import 'package:flutter_day2_ex/res/callbacks.dart';
import 'package:flutter_day2_ex/res/dimens.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';
import 'package:flutter_day2_ex/res/styles.dart';
import 'package:flutter_day2_ex/widget/rounded_checkbox.dart';

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
  ExpTimeBloc expTimeTickerBloc;

  @override
  void initState() {
    super.initState();

    isChecked = widget.task.isCompleted;
    expTimeTickerBloc = kExpTimeTickerBloc;
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
    final textStyle =
        isChecked ? Styles.completedTaskTitle : Styles.activeTaskTitle;

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
          ? Colors.grey.withOpacity(0.5)
          : Colors.black.withOpacity(0.25);
    }

    return Container(
      margin: EdgeInsets.only(
          bottom: Dimens.gap_dp16,
          left: Dimens.gap_dp16,
          right: Dimens.gap_dp16),
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.gap_dp24, vertical: Dimens.gap_dp8),
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
          // Wrap Expanded -> Container -> Text for textOverflow
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text(
                    widget.task.title,
                    style: textStyle.copyWith(decoration: textDecoration),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _buildExpTime(),
              ],
            ),
          ),
          Gaps.hGap8,
          RoundedCheckbox(value: isChecked, onChanged: _onChecked),
        ],
      ),
    );
  }

  Widget _buildExpTime() {
    final task = widget.task;
    if (task.isOutExpTime()) {
      return Column(
        children: [
          Gaps.vGap8,
          Text("Exp date"),
        ],
      );
    }

    return StreamBuilder(
      stream: expTimeTickerBloc.ticker,
      builder: (context, snapshot) {},
    );
  }
}
