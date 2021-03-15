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
    int second = (exp % 60);
    String strSecond = second > 10 ? second : "0$second";

    return "$minus : $strSecond";
  }
}
