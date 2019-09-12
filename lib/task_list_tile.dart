import 'package:flutter/material.dart';
import 'package:todoey/task_data_modal.dart';
import 'package:provider/provider.dart';

class TaskListTile extends StatelessWidget {
  final String name;
  final bool isChecked;
  final Function changeCheckState;

  TaskListTile({this.name, this.isChecked, this.changeCheckState});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskDataModal>(
      builder: (context, task, child) {
        return Container(
          margin: EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            color: isChecked ? Colors.redAccent : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            onLongPress: () {
              Provider.of<TaskDataModal>(context).delete();
            },
            title: Text(
              '$name',
              style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: isChecked,
              onChanged: changeCheckState,
            ),
            onTap: () {
              changeCheckState(isChecked);
            },
          ),
        );
      },
    );
  }
}
