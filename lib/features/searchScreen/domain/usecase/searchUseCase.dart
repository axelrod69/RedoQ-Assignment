import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/searchScreen/domain/repository/searchRepository.dart';

class SearchTasksUseCase {
  final SearchTaskRepository searchTaskRepository;

  SearchTasksUseCase({required this.searchTaskRepository});

  List<TaskModel> searchTasks(String query) {
    return searchTaskRepository.searchTasks(query);
  }
}
