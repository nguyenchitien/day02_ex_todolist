import 'package:flutter/foundation.dart';

class TodoListModel {
  final String _title;
  bool _isCompleted = false;

  TodoListModel({@required String title}) : _title = title;

  String get title => _title;

  set completed(bool isCompleted) {
    _isCompleted = isCompleted;
  }

  bool get isCompleted => _isCompleted;

  @override
  String toString() {
    return "TodoListModel( $_title, $_isCompleted )";
  }
}
