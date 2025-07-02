import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

abstract class SearchTaskRepository {
  List<TaskModel> searchTasks(String query);
}