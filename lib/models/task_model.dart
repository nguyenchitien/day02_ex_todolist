import 'package:flutter/foundation.dart';
import 'package:flutter_day2_ex/bloc/exp_timer_bloc.dart';

class TaskModel {
  final String _title;
  int _expTime; // minus
  int _reduceTime;
  bool _isCompleted = false;

  TaskModel({
    @required String title,
    expTime = 1,
  })  : _title = title,
        _expTime = expTime * 60,
        _reduceTime = 0;

  String get title => _title;

  set completed(bool isCompleted) {
    _isCompleted = isCompleted;
    _reduceTime = _expTime;
  }

  void reduceExpTime(int reduceTime) {
    if (reduceTime == ExpTickerBloc.RESET_VALUE) {
      _expTime -= _reduceTime;
      _reduceTime = 0;
    } else {
      _reduceTime = reduceTime;
    }
  }

  bool isOutExpTime() {
    return _expTime <= _reduceTime ? true : false;
  }

  int get remainTime => _expTime - _reduceTime;

  bool get isCompleted => _isCompleted;

  @override
  String toString() {
    return "TaskModel( $_title, $_isCompleted )";
  }
}
