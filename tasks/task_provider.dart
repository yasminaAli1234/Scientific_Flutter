import 'package:flutter/material.dart';

import '../models/task.dart';


class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTaskStatus(String id, String status) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(
        id: _tasks[taskIndex].id,
        title: _tasks[taskIndex].title,
        description: _tasks[taskIndex].description,
        assignee: _tasks[taskIndex].assignee,
        dueDate: _tasks[taskIndex].dueDate,
        status: status,
      );
      notifyListeners();
    }
  }
}