import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/mock_data/mock_data.dart';
import 'package:flutter_day2_ex/models/task_model.dart';
import 'package:flutter_day2_ex/res/dimens.dart';
import 'package:flutter_day2_ex/res/filter_modes.dart';
import 'package:flutter_day2_ex/ui/list_tasks.dart';
import 'package:flutter_day2_ex/utils/utils.dart';
import 'package:flutter_day2_ex/widget/filter_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final originTasks = [...fakeData];
  final filterModes = Utils.listFilterModes;

  FilterMode currFilterMode;
  List<TaskModel> currTasks;

  @override
  void initState() {
    super.initState();

    // set default value
    currTasks = originTasks;
    currFilterMode = FilterMode.all;
  }

  _handleSelectedFilterMode(FilterMode filterMode) {
    if (filterMode != currFilterMode) {
      setState(() {
        currFilterMode = filterMode;
        _refreshCurrTasks(filterMode);
      });
    }
  }

  _refreshCurrTasks(FilterMode filterMode) {
    if (filterMode == FilterMode.active) {
      currTasks = originTasks.where((task) => !task.isCompleted).toList();
    } else if (filterMode == FilterMode.completed) {
      currTasks = originTasks.where((task) => task.isCompleted).toList();
    } else {
      currTasks = originTasks;
    }
  }

  _handleCompletedTask(TaskModel task, bool isCompleted) {
    if (currFilterMode != FilterMode.all) {
      setState(() {
        int index = originTasks.indexOf(task);
        task.completed = isCompleted;
        originTasks[index] = task;
        _refreshCurrTasks(currFilterMode);
      });
    } else {
      int index = originTasks.indexOf(task);
      task.completed = isCompleted;
      originTasks[index] = task;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.vGap24,
        FilterTabs(
          listFilters: filterModes,
          currFilterMode: currFilterMode,
          onSelectFilterMode: _handleSelectedFilterMode,
        ),
        Gaps.vGap24,
        Expanded(
          child: ListTasks(
            title: "${currFilterMode.title}",
            tasks: currTasks,
            onCompletedTaskCallBack: _handleCompletedTask,
          ),
        ),
      ],
    );
  }
}
