import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/features/homeScreen/data/datasource/assigneeDataSource.dart';
import 'package:redoq_assignment/features/homeScreen/data/datasource/taskDataSource.dart';
import 'package:redoq_assignment/features/homeScreen/data/respository/assigneeRepositoryImpl.dart';
import 'package:redoq_assignment/features/homeScreen/data/respository/taskDataRepositoryImpl.dart';
import 'package:redoq_assignment/features/homeScreen/domain/repository/assigneeRepository.dart';
import 'package:redoq_assignment/features/homeScreen/domain/repository/taskDataRepository.dart';
import 'package:redoq_assignment/features/homeScreen/domain/useCase/assigneeUseCase.dart';
import 'package:redoq_assignment/features/homeScreen/domain/useCase/taskDataUseCase.dart';
import 'package:redoq_assignment/features/searchScreen/data/datasource/searchDataSource.dart';
import 'package:redoq_assignment/features/searchScreen/data/repository/searchRepositoryImpl.dart';
import 'package:redoq_assignment/features/searchScreen/domain/repository/searchRepository.dart';
import 'package:redoq_assignment/features/searchScreen/domain/usecase/searchUseCase.dart';

// Use Cases
final assigneeUseCaseProvider = Provider<AssigneeUseCase>(
    (ref) => AssigneeUseCase(ref.read(assigneeRepositoryProvider)));
final taskDataUseCaseProvider = Provider<TaskDataUseCase>((ref) =>
    TaskDataUseCase(taskDataRepository: ref.read(taskDataRepositoryProvider)));
final searchUseCaseProvider = Provider<SearchTasksUseCase>((ref) =>
    SearchTasksUseCase(
        searchTaskRepository: ref.read(searchTaskRepositoryProvider)));

// Repositories
final assigneeRepositoryProvider = Provider<AssigneeRepository>(
    (ref) => AsigneeRepositoryImpl(ref.read(assigneeDataSourceProvider)));
final taskDataRepositoryProvider = Provider<TaskDataRepository>((ref) =>
    TaskDataRepositoryImpl(taskDataSource: ref.read(taskDataSourceProvider)));
final searchTaskRepositoryProvider = Provider<SearchTaskRepository>((ref) =>
    SearchTaskRepositoryImpl(
        searchTaskDataSource: ref.read(searchTaskDataSource)));

// Data Source
final assigneeDataSourceProvider =
    Provider<AssigneeDataSource>((ref) => AssigneeDataSourceImpl());
final taskDataSourceProvider =
    Provider<TaskDataSource>((ref) => TaskDataSourceImpl());
final searchTaskDataSource =
    Provider<SearchTaskDataSource>((ref) => SearchTaskDataSourceImpl());
