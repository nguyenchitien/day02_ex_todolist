import 'package:flutter/cupertino.dart';
import 'package:flutter_day2_ex/mock_data/mock_data.dart';
import 'package:flutter_day2_ex/models/todo_list_model.dart';
import 'package:flutter_day2_ex/res/filter_modes.dart';
import 'package:flutter_day2_ex/res/global_configurations.dart';
import 'package:flutter_day2_ex/ui/list_tasks.dart';
import 'package:flutter_day2_ex/utils/utils.dart';
import 'package:flutter_day2_ex/widget/filter_tabs.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final originTasks = [...fakeData];
  final filterModes = Utils.listFilterModes;

  var currFilterMode;
  var currTasks;

  @override
  void initState() {
    super.initState();

    // set default value
    currTasks = originTasks;
    currFilterMode = FilterMode.all;
  }

  _handleSelectedFilterMode(FilterMode filterMode) {
    setState(() {
      currFilterMode = filterMode;
      _refreshCurrTasks(filterMode);
    });
  }

  _refreshCurrTasks(FilterMode filterMode) {
    if (filterMode == FilterMode.active) {
      currTasks = originTasks.where((todo) => !todo.isCompleted).toList();
    } else if (filterMode == FilterMode.completed) {
      currTasks = originTasks.where((todo) => todo.isCompleted).toList();
    } else {
      currTasks = originTasks;
    }
  }

  _handleCompletedTodoList(TodoListModel todo, bool isCompleted) {
    if (currFilterMode != FilterMode.all) {
      setState(() {
        int index = originTasks.indexOf(todo);
        todo.completed = isCompleted;
        originTasks[index] = todo;
        _refreshCurrTasks(currFilterMode);
      });
    } else {
      int index = originTasks.indexOf(todo);
      todo.completed = isCompleted;
      originTasks[index] = todo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = GlobalConfigurations.isDarkMode;

    return Column(
      children: [
        SizedBox(height: 16),
        FilterTabs(
          listFilters: filterModes,
          currFilterMode: currFilterMode,
          onSelectFilterMode: _handleSelectedFilterMode,
        ),
        SizedBox(height: 16),
        ListTasks(
          todoLists: currTasks,
          onCompletedTaskCallBack: _handleCompletedTodoList,
        ),
      ],
    );
  }
}
