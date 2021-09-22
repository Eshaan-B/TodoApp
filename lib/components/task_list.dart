import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import './task_item.dart';

class TaskListView extends StatefulWidget {
  TaskListView({this.taskItemList});
  final taskItemList;

  @override
  _TaskListViewState createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 18.0,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.red,
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'DELETE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              child: TaskItem(
                text: taskData.tasks[index].title,
                isComplete: taskData.tasks[index].isComplete,
                toggleTask: (checkboxState) {
                  Provider.of<TaskData>(context, listen: false)
                      .toggleTask(taskData.tasks[index]);
                },
//                longPressCallBack: () {
//                  Provider.of<TaskData>(context, listen: false)
//                      .deleteTask(taskData.tasks[index]);
//                },
                ),
              );
            },
            itemCount: taskData.taskLength(),
          ),
        );
      },
    );
  }
}
