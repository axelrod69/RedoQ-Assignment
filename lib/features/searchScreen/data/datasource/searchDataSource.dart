import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';

abstract class SearchTaskDataSource {
  List<TaskModel> getTasks();
}

class SearchTaskDataSourceImpl implements SearchTaskDataSource {
  @override
  List<TaskModel> getTasks() {
    final Box<TaskModel> taskBox = Hive.box<TaskModel>('allTaskBox');
    return taskBox.values.toList();
  }
}