import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:redoq_assignment/core/utils/helper.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

abstract class TaskDataSource {
  List<TaskModel> getTasks();
  List<TaskModel> getInProgressTasks();
  List<TaskModel> getDoneTasks();
  List<TaskModel> getAllTasks();

  Future<List<TaskModel>> addToTaskList({required TaskModel task});
  Future<List<TaskModel>> addToInProgress({required TaskModel task});
  Future<List<TaskModel>> addToCompleted({required TaskModel task});
  Future<List<TaskModel>> updateTask(
      {required TaskModel updatedTask, required String boxName});
  Future<List<TaskModel>> deleteTask(
      {required int taskId, required String boxName});
}

class TaskDataSourceImpl extends TaskDataSource {
  @override
  Future<List<TaskModel>> addToCompleted({required TaskModel task}) async {
    // TODO: implement addToCompleted
    final Box<TaskModel> completedBox = Hive.box<TaskModel>('completedBox');
    final Box<TaskModel> allTaskBox = Hive.box<TaskModel>('allTaskBox');      // To update the box with allTaskBox data

    await completedBox.add(task);

    await allTaskBox.add(task);

    return completedBox.values.toList();
  }

  @override
  Future<List<TaskModel>> addToInProgress({required TaskModel task}) async {
    // TODO: implement addToInProgress
    final Box<TaskModel> inProgressBox = Hive.box<TaskModel>('inProgressBox');
    final Box<TaskModel> allTaskBox = Hive.box<TaskModel>('allTaskBox');      // To update the box with inProgressBox data

    await inProgressBox.add(task);

    await allTaskBox.add(task);

    return inProgressBox.values.toList();
  }

  @override
  Future<List<TaskModel>> addToTaskList({required TaskModel task}) async {
    // TODO: implement addToTaskList
    final Box<TaskModel> taskBox = Hive.box<TaskModel>('taskBox');
    final Box<TaskModel> allTaskBox = Hive.box<TaskModel>('allTaskBox');   // To update the box with taskBox data

    await taskBox.add(task);

    await allTaskBox.add(task);

    return taskBox.values.toList();
  }

  @override
  List<TaskModel> getDoneTasks() {
    // TODO: implement getDoneTasks
    final Box<TaskModel> completedBox = Hive.box<TaskModel>('completedBox');

    return completedBox.values.toList();
  }

  @override
  List<TaskModel> getInProgressTasks() {
    // TODO: implement getInProgressTasks
    final Box<TaskModel> inProgressBox = Hive.box<TaskModel>('inProgressBox');

    return inProgressBox.values.toList();
  }

  @override
  List<TaskModel> getTasks() {
    // TODO: implement getTasks
    final Box<TaskModel> taskBox = Hive.box<TaskModel>('taskBox');

    return taskBox.values.toList();
  }

  @override
  Future<List<TaskModel>> deleteTask(
      {required int taskId, required String boxName}) async {
    // TODO: implement deleteTask
    final box = Hive.box<TaskModel>(boxName == 'To Do'
        ? 'taskBox'
        : boxName == 'In Progress'
            ? 'inProgressBox'
            : 'completedBox');

    // Deletes Task from the current box

    final key = box.keys.firstWhere(
      (key) => box.get(key)?.taskId == taskId,
      orElse: () => null,
    );
    if (key != null) {
      await box.delete(key);
    }
    return box.values.toList();
  }

  // Updates existing data and also transfers them across boxes when status is changed.
  @override
  Future<List<TaskModel>> updateTask(
      {required TaskModel updatedTask, required String boxName}) async {
    // TODO: implement updateTask
    final oldStatus = updatedTask.status;
    final allBoxes = {
      'To Do': 'taskBox',
      'In Progress': 'inProgressBox',
      'Done': 'completedBox',
    };
    final allTaskBox = Hive.box<TaskModel>('allTaskBox');      // This box holds data from all boxes meant for filtering out as per query

    final oldBox = Hive.box<TaskModel>(
        allBoxes[Helper.existingTaskStatus(updatedTask.taskId)] ?? 'taskBox');    // This holds the boxName prior to updating status
    final newBox = Hive.box<TaskModel>(allBoxes[boxName] ?? 'taskBox');           // This holds the boxName post selecting new status

    // Looks for the taskId in the old box so that it can be deleted
    final key = oldBox.keys.firstWhere(                                           
      (k) => oldBox.get(k)?.taskId == updatedTask.taskId,
      orElse: () => null,
    );

    if (key != null) {
      await oldBox.delete(key);
    }

    await newBox.add(updatedTask);       // Updates the new box
    

    // Deletes the old data by their taskId and updates itself with the new data
    final allKey = allTaskBox.keys.firstWhere(
      (k) => allTaskBox.get(k)?.taskId == updatedTask.taskId,
      orElse: () => null,
    );
    if (allKey != null) {
      await allTaskBox.delete(allKey);
    }
    await allTaskBox.add(updatedTask);

    return newBox.values.toList();
  }

  @override
  List<TaskModel> getAllTasks() {
    // TODO: implement getAllTasks
    final Box<TaskModel> taskBox = Hive.box<TaskModel>('allTaskBox');

    return taskBox.values.toList();
  }
}
