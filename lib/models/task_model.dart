import 'package:flutter/foundation.dart';

class TaskModel {
  final String _title;
  int _expTime; // minus
  bool _isCompleted = false;

  TaskModel({
    @required String title,
    expTime = 5,
  })  : _title = title,
        _expTime = expTime * 60;

  String get title => _title;

  set completed(bool isCompleted) {
    _isCompleted = isCompleted;
  }

  void reduceExpTime() {
    if (_expTime > 0) {
      _expTime -= 1;
    }
  }

  bool isOutExpTime() {
    return _expTime == 0 ? true : false;
  }

  int get expTime => _expTime;

  bool get isCompleted => _isCompleted;

  @override
  String toString() {
    return "TaskModel( $_title, $_isCompleted )";
  }
}
