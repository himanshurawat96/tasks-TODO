import 'package:flutter/material.dart';
import 'package:todoey/task_modal.dart';

class BottomSheetPage extends StatelessWidget {
  const BottomSheetPage({
    Key key,
    @required TextEditingController controller,
    @required this.tasks,
    @required this.onButtonPress,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final List<Task> tasks;
  final Function onButtonPress;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Note',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 13),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Your Note',
                    ),
                    // decoration: InputDecoration(
                    //   hintText: 'Your Note',
                    //   alignLabelWithHint: true,
                    //   filled: true,
                    //   fillColor: Colors.blueGrey[200],
                    //   border: InputBorder.none,
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 40,
                    minWidth: 120,
                  ),
                  child: FlatButton(
                    color: Colors.blueGrey,
                    onPressed: onButtonPress,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
