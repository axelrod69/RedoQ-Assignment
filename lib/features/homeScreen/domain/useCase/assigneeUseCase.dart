import 'package:redoq_assignment/features/homeScreen/domain/model/assigneeModel.dart';
import 'package:redoq_assignment/features/homeScreen/domain/repository/assigneeRepository.dart';

class AssigneeUseCase {
  AssigneeRepository assigneeRepository;

  AssigneeUseCase(this.assigneeRepository);

  List<AssigneeModel> getList() {
    return assigneeRepository.asigneeList();
  }
}
