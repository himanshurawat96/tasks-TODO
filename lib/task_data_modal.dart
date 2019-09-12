
import 'package:flutter/widgets.dart';
import 'package:todoey/task_modal.dart';

class TaskDataModal extends ChangeNotifier {
  List<Task> tasks = [];

  void delete(){
    tasks.removeWhere((task) => task.taskDone==true);
    notifyListeners();
  }
}