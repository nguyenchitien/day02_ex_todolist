import 'package:flutter_day2_ex/res/strings.dart';

enum FilterMode { all, active, completed, exp }

extension FilterModeEx on FilterMode {
  String get title => _getTitle(this);

  String _getTitle(FilterMode filterMode) {
    var title;
    switch (filterMode) {
      case FilterMode.all:
        title = Strings.allTaskTitle;
        break;
      case FilterMode.active:
        title = Strings.activeTaskTitle;
        break;
      case FilterMode.completed:
        title = Strings.completedTaskTitle;
        break;
      default:
        title = Strings.expTitle;
        break;
    }
    return title;
  }
}
