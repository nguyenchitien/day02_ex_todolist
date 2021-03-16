import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
import 'package:flutter_day2_ex/res/callbacks.dart';
import 'package:flutter_day2_ex/res/dimens.dart';
import 'package:flutter_day2_ex/res/styles.dart';
import 'package:flutter_day2_ex/widget/task_item.dart';

import '../bloc/exp_timer_bloc.dart';
import '../models/task_model.dart';

class ListTasks extends StatefulWidget {
  final title;
  final List<TaskModel> tasks;
  final CompletedTaskCallback onCompletedTaskCallBack;
  final Function(TaskModel, int) onReduceExpTime;

  const ListTasks({
    Key key,
    @required this.title,
    @required this.tasks,
    @required this.onCompletedTaskCallBack,
    this.onReduceExpTime,
  }) : super(key: key);

  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      kExpTickerBloc.startTicker();
    });
  }

  @override
  void dispose() {
    kExpTickerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasks.length == 0) {
      final height = 2 * MediaQuery.of(context).size.height / 3;
      return Container(
        height: height,
        child: Center(
          child: Text("Empty tasks."),
        ),
      );
    }
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.gap_dp16),
            child: Text(
              "${widget.title} Tasks",
              style: Styles.headingTitle,
            ),
          ),
          Gaps.vGap24,
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final task = widget.tasks[index];
              return TaskItem(
                key: UniqueKey(),
                task: task,
                onCompletedTaskCallback: widget.onCompletedTaskCallBack,
                onReduceExpTime: widget.onReduceExpTime,
              );
            },
            itemCount: widget.tasks.length,
          ),
        ],
      ),
    );
  }
}
