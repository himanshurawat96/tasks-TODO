class Task {
  String taskName;
  bool taskDone;

  Task({this.taskName, this.taskDone = false});

  void taskIsDone(){
    taskDone = !taskDone;
  }
}