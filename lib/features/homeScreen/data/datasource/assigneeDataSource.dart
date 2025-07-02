import 'package:redoq_assignment/features/homeScreen/domain/model/assigneeModel.dart';

abstract class AssigneeDataSource {
  List<AssigneeModel> assigneeList();
}

class AssigneeDataSourceImpl extends AssigneeDataSource {
  @override
  List<AssigneeModel> assigneeList() {
    // TODO: implement assigneeList

    // Data List
    final List<AssigneeModel> assigneeModel = [
      AssigneeModel(
          name: 'Ruben Amorim',
          department: 'Manager',
          image: 'assets/images/ruben.png'),
      AssigneeModel(
          name: 'Bruno Fernandes',
          department: 'Attacking/Central/Deep Lying Midfielder',
          image: 'assets/images/bruno.png'),
      AssigneeModel(
          name: 'Rasmus Hojlund',
          department: 'Forward',
          image: 'assets/images/rasmus.png'),
      AssigneeModel(
          name: 'Mason Mount',
          department: 'Attacking/Central Midfielder',
          image: 'assets/images/mason.png'),
      AssigneeModel(
          name: 'Harry Maguire',
          department: 'Centre Back',
          image: 'assets/images/harry.png'),
      AssigneeModel(
          name: 'Luke Shaw',
          department: 'Left Back/Left Wing Back/Centre Back',
          image: 'assets/images/luke.jpeg'),
    ];

    return assigneeModel;
  }
}
