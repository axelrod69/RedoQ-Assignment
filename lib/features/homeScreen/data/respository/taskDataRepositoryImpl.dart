import 'package:redoq_assignment/features/homeScreen/data/datasource/taskDataSource.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/repository/taskDataRepository.dart';

class TaskDataRepositoryImpl extends TaskDataRepository {
  final TaskDataSource taskDataSource;

  TaskDataRepositoryImpl({required this.taskDataSource});

  @override
  Future<List<TaskModel>> addToCompleted({required TaskModel task}) async {
    // TODO: implement addToCompleted
    return await taskDataSource.addToCompleted(task: task);
  }

  @override
  Future<List<TaskModel>> addToInProgress({required TaskModel task}) async {
    // TODO: implement addToInProgress
    return await taskDataSource.addToInProgress(task: task);
  }

  @override
  Future<List<TaskModel>> addToTaskList({required TaskModel task}) async {
    // TODO: implement addToTaskList
    return await taskDataSource.addToTaskList(task: task);
  }

  @override
  List<TaskModel> getDoneTasks() {
    // TODO: implement getDoneTasks
    return taskDataSource.getDoneTasks();
  }

  @override
  List<TaskModel> getInProgressTasks() {
    // TODO: implement getInProgressTasks
    return taskDataSource.getInProgressTasks();
  }

  @override
  List<TaskModel> getTasks() {
    // TODO: implement getTasks
    return taskDataSource.getTasks();
  }

  @override
  Future<List<TaskModel>> deleteTask(
      {required int taskId, required String boxName}) async {
    // TODO: implement deleteTask
    return taskDataSource.deleteTask(taskId: taskId, boxName: boxName);
  }

  @override
  Future<List<TaskModel>> updateTask(
      {required TaskModel updatedTask, required String boxName}) async {
    // TODO: implement updateTask
    return taskDataSource.updateTask(
        updatedTask: updatedTask, boxName: boxName);
  }

  @override
  List<TaskModel> getAllTasks() {
    // TODO: implement getAllTasks
    return taskDataSource.getAllTasks();
  }
}
