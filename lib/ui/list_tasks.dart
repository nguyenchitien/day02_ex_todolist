import 'package:flutter/cupertino.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
import 'package:flutter_day2_ex/utils/callbacks.dart';
import 'package:flutter_day2_ex/utils/utils.dart';
import 'package:flutter_day2_ex/widget/task_item.dart';

class ListTasks extends StatefulWidget {
  final List<TaskModel> tasks;
  final CompletedTaskCallback onCompletedTaskCallBack;

  const ListTasks(
      {Key key, @required this.tasks, @required this.onCompletedTaskCallBack})
      : super(key: key);

  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    if (widget.tasks.length == 0) {
      final height = MediaQuery.of(context).size.height / 2;

      return Container(
        height: height,
        child: Center(
          child: Text("Empty tasks."),
        ),
      );
    }
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView.builder(
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
      ),
    );
  }
}
