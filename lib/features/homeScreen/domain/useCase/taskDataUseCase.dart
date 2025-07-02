import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/repository/taskDataRepository.dart';

class TaskDataUseCase {
  final TaskDataRepository taskDataRepository;

  TaskDataUseCase({required this.taskDataRepository});

  List<TaskModel> getTasks() {
    return taskDataRepository.getTasks();
  }

  List<TaskModel> getInProgressTasks() {
    return taskDataRepository.getInProgressTasks();
  }

  List<TaskModel> getDoneTasks() {
    return taskDataRepository.getDoneTasks();
  }

  List<TaskModel> getAllTasks() {
    return taskDataRepository.getAllTasks();
  }

  Future<List<TaskModel>> addToTaskList({required TaskModel task}) async {
    return await taskDataRepository.addToTaskList(task: task);
  }

  Future<List<TaskModel>> addToInProgress({required TaskModel task}) async {
    return await taskDataRepository.addToInProgress(task: task);
  }

  Future<List<TaskModel>> addToCompleted({required TaskModel task}) async {
    return await taskDataRepository.addToCompleted(task: task);
  }

  Future<List<TaskModel>> updateTask(
      {required TaskModel updatedTask, required String boxName}) async {
    return await taskDataRepository.updateTask(
        updatedTask: updatedTask, boxName: boxName);
  }

  Future<List<TaskModel>> deleteTask(
      {required int taskId, required String boxName}) async {
    return await taskDataRepository.deleteTask(
        taskId: taskId, boxName: boxName);
  }
}
