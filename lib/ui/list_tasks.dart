import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
import 'package:flutter_day2_ex/utils/callbacks.dart';
import 'package:flutter_day2_ex/widget/task_item.dart';

class ListTasks extends StatefulWidget {
  final title;
  final List<TaskModel> tasks;
  final CompletedTaskCallback onCompletedTaskCallBack;

  const ListTasks(
      {Key key,
      @required this.title,
      @required this.tasks,
      @required this.onCompletedTaskCallBack})
      : super(key: key);

  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "${widget.title} Tasks",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 24),
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
              );
            },
            itemCount: widget.tasks.length,
          ),
        ],
      ),
    );
  }
}
