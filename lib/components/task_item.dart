import 'package:flutter/material.dart';
import 'package:todo/constants.dart';

class TaskItem extends StatelessWidget {
  TaskItem(
      {this.text, this.isComplete, this.toggleTask, this.longPressCallBack});
  final String text;
  final bool isComplete;
  final Function toggleTask;
  final Function longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onLongPress: longPressCallBack,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: kTaskStyle.copyWith(
                  decoration: isComplete ? TextDecoration.lineThrough : null,
                  color: isComplete ? Colors.grey : Colors.white,
                ),
              ),
              Checkbox(
                value: isComplete,
                onChanged: toggleTask,
              )
            ],
          ),
        ),
      ),
    );
  }
}
