import 'package:flutter/material.dart';
import 'package:todoey/task_modal.dart';
import 'package:todoey/task_list_tile.dart';

class TODOData extends StatelessWidget {
  const TODOData({
    Key key,
    @required this.tasks,
    @required this.showSheet,
    @required this.taskCheckState,
  }) : super(key: key);

  final List<Task> tasks;
  final Function showSheet;
  final Function taskCheckState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: tasks.length == 0
          ? Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(
                        Icons.add_circle_outline,
                        size: 100,
                        color: Colors.blueGrey[700],
                      ),
                      onTap: showSheet,
                    ),
                    Text(
                      'Please Add Some Notes',
                      style: TextStyle(
                        color: Colors.blueGrey[700],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, i) {
                return TaskListTile(
                  name: tasks[i].taskName,
                  isChecked: tasks[i].taskDone,
                  changeCheckState: (check) {
                    taskCheckState(i);
                  },
                );
              },
            ),
    );
  }
}
