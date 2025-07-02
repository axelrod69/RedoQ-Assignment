import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

class Helper {
  static String? existingTaskStatus(int? taskId) {
    if (taskId == null) return null;

    final taskBox = Hive.box<TaskModel>('taskBox');
    final inProgressBox = Hive.box<TaskModel>('inProgressBox');
    final completedBox = Hive.box<TaskModel>('completedBox');

    if (taskBox.values.any((task) => task.taskId == taskId)) return 'To Do';
    if (inProgressBox.values.any((task) => task.taskId == taskId))
      return 'In Progress';
    if (completedBox.values.any((task) => task.taskId == taskId)) return 'Done';

    return null;
  }
}
