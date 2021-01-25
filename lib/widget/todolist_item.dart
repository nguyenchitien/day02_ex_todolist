import 'package:flutter/material.dart';
import 'package:flutter_day2_ex/widget/rounded_checbox.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({
    Key key,
    @required this.todo,
  }) : super(key: key);

  final String todo;

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool isChecked = false;

  void _handleOnChange() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textDecoration = isChecked ? TextDecoration.lineThrough : null;
    final backgroundColor = isChecked ? Colors.black26 : Colors.black45;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.todo,
            style: TextStyle(fontSize: 16, decoration: textDecoration),
          ),
          RoundedCheckbox(value: isChecked, onChanged: _handleOnChange),
        ],
      ),
    );
  }
}
