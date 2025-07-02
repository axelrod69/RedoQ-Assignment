import 'package:flutter_test/flutter_test.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/searchScreen/data/datasource/searchDataSource.dart';
import 'package:redoq_assignment/features/searchScreen/data/repository/searchRepositoryImpl.dart';

class FakeSearchTaskDataSource implements SearchTaskDataSource {
  @override
  List<TaskModel> getTasks() {
    return [
      TaskModel(
        title: 'Fix login bug',
        name: 'Alice',
        priority: 'High',
        position: 'Developer',
        image: 'image1.png',
        eta: '2025-07-01',
        status: 'To Do',
        description: 'Important bug',
      ),
      TaskModel(
        title: 'Update Docs',
        name: 'Bob',
        priority: 'Low',
        position: 'Writer',
        image: 'image2.png',
        eta: '2025-07-02',
        status: 'In Progress',
        description: 'Documentation update',
      ),
      TaskModel(
        title: 'Review Code',
        name: 'Charlie',
        priority: 'Medium',
        position: 'Reviewer',
        image: 'image3.png',
        eta: '2025-07-03',
        status: 'Done',
        description: 'Code review',
      ),
    ];
  }
}

void main() {
  late SearchTaskRepositoryImpl repository;

  setUp(() {
    repository = SearchTaskRepositoryImpl(
      searchTaskDataSource: FakeSearchTaskDataSource(),
    );
  });

  test('Filters tasks by title', () {
    final result = repository.searchTasks('login');
    expect(result.length, 1);
    expect(result.first.title, contains('Fix login bug'));
  });

  test('Filters tasks by assignee name', () {
    final result = repository.searchTasks('bob');
    expect(result.length, 1);
    expect(result.first.name, equals('Bob'));
  });

  test('Filters tasks by priority', () {
    final result = repository.searchTasks('medium');
    expect(result.length, 1);
    expect(result.first.priority, equals('Medium'));
  });

  test('Returns empty list when no match found', () {
    final result = repository.searchTasks('nonexistent');
    expect(result.isEmpty, isTrue);
  });
}