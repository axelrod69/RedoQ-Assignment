import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

abstract class TaskDataRepository {
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
