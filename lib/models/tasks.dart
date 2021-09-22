class Task {
  String title;
  bool isComplete;

  Task({this.title, this.isComplete});

  void toggleComplete() {
    isComplete = !isComplete;
  }
}
