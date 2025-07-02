import 'package:redoq_assignment/features/homeScreen/data/datasource/assigneeDataSource.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/assigneeModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/repository/assigneeRepository.dart';

class AsigneeRepositoryImpl extends AssigneeRepository {
  AssigneeDataSource assigneeDataSource;

  AsigneeRepositoryImpl(this.assigneeDataSource);

  @override
  List<AssigneeModel> asigneeList() {
    // TODO: implement asigneeList
    return assigneeDataSource.assigneeList();
  }
}
