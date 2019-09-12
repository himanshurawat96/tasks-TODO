import 'package:flutter/material.dart';
import 'package:todoey/bottom_sheet_page.dart';
import 'package:todoey/task_data_modal.dart';
import 'package:todoey/task_modal.dart';
import 'package:todoey/todo_data.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskDataModal(),
      child: MaterialApp(
        title: 'TODOey',
        theme: ThemeData(accentColor: Colors.blueGrey),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = false;
  TextEditingController _controller = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskDataModal>(context).tasks;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blueGrey[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 60, 20, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.format_list_bulleted,
                    color: Colors.blueGrey[800],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Tasks-TODO',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      tasks.length <= 1
                          ? '${tasks.length} Task'
                          : '${tasks.length} Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    tasks.length==0 ? Center() : GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                      onTap: () {
                        if (tasks.length == 0) {
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('No Task Available To Delete!!!!'),
                            ),
                          );
                        } else {
                          Provider.of<TaskDataModal>(context).delete();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text('Task Deleted!!!!'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: TODOData(
              tasks: tasks,
              showSheet: showSheet,
              taskCheckState: (i) {
                setState(() {
                  tasks[i].taskIsDone();
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showSheet,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey[800],
        tooltip: 'Add Note',
      ),
    );
  }

  void showSheet() {
    var tasks = Provider.of<TaskDataModal>(context).tasks;
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomSheetPage(
            controller: _controller,
            tasks: tasks,
            onButtonPress: () {
              setState(() {
                tasks.add(Task(
                  taskName: _controller.text,
                ));
                _controller.text = '';
                Navigator.pop(context);
              });
            },
          );
        });
  }
}
