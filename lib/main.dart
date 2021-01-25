import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/widget/rounded_checbox.dart';
import 'package:flutter_day2_ex/widget/todolist_item.dart';
import './mock_data/mock_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "All Tasks",
          ),
        ),
        body: TodoList(todos: FAKE_DATA),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TodoList extends StatefulWidget {
  final List<String> todos;

  const TodoList({Key key, this.todos}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          final todo = widget.todos[index];
          return TodoListItem(todo: todo);
        },
        itemCount: widget.todos.length,
      ),
    );
  }
}
