import 'package:flutter_day2_ex/models/todo_list_model.dart';
import 'package:flutter_day2_ex/res/filter_modes.dart';

typedef CompletedTaskCallback = void Function(TodoListModel, bool);

class Utils {
  static final _listFilterModes = [
    FilterMode.all,
    FilterMode.active,
    FilterMode.completed
  ];
  static List<FilterMode> get listFilterModes => _listFilterModes;
}
