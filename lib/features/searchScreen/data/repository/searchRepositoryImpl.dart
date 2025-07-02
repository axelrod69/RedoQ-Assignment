import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/searchScreen/data/datasource/searchDataSource.dart';
import 'package:redoq_assignment/features/searchScreen/domain/repository/searchRepository.dart';

class SearchTaskRepositoryImpl implements SearchTaskRepository {
  final SearchTaskDataSource searchTaskDataSource;

  SearchTaskRepositoryImpl({required this.searchTaskDataSource});

  // Filters allTaskBox as per title, name or priority
  @override
  List<TaskModel> searchTasks(String query) {
    final allTasks = searchTaskDataSource.getTasks();
    return allTasks.where((task) {
      final q = query.toLowerCase();
      return task.title!.toLowerCase().contains(q) ||
          task.name!.toLowerCase().contains(q) ||
          task.priority!.toLowerCase().contains(q);
    }).toList();
  }
}
