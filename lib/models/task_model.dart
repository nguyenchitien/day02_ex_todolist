import 'package:flutter/foundation.dart';

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
    if (reduceTime != null) {
      _reduceTime = reduceTime;
    } else {
      _reduceTime = 0;
    }
  }

  bool isOutExpTime() {
    return _expTime == _reduceTime || _reduceTime > _expTime ? true : false;
  }

  int get remainTime => _expTime - _reduceTime;

  bool get isCompleted => _isCompleted;

  @override
  String toString() {
    return "TaskModel( $_title, $_isCompleted )";
  }
}
