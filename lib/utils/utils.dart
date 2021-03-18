import 'package:flutter_day2_ex/res/filter_modes.dart';

import '../res/filter_modes.dart';

class Utils {
  static final _listFilterModes = [
    FilterMode.all,
    FilterMode.active,
    FilterMode.completed,
    FilterMode.exp
  ];
  static List<FilterMode> get listFilterModes => _listFilterModes;

  static String formatExpTime(int exp) {
    int minus = (exp / 60.0).floor();
    int seconds = (exp % 60);
    String strMinus = _formatTime(minus);
    String strSecond = _formatTime(seconds);

    return "$strMinus:$strSecond";
  }

  static String _formatTime(int time) {
    return time >= 10 ? "$time" : "0$time";
  }
}
