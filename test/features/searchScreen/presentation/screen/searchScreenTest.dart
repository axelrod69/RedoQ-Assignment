import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/providers/dependencyInjection.dart';
import 'package:redoq_assignment/features/homeScreen/domain/model/taskModel.dart';
import 'package:redoq_assignment/features/searchScreen/domain/repository/searchRepository.dart';
import 'package:redoq_assignment/features/searchScreen/domain/usecase/searchUseCase.dart';
import 'package:redoq_assignment/features/searchScreen/presentation/screens/searchScreen.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchTasksUseCase extends Mock implements SearchTasksUseCase {
  @override
  // TODO: implement searchTaskRepository
  SearchTaskRepository get searchTaskRepository => throw UnimplementedError();

  @override
  List<TaskModel> searchTasks(String query) {
    // TODO: implement searchTasks
    throw UnimplementedError();
  }
}

void main() {
  late MockSearchTasksUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockSearchTasksUseCase();
  });

  Widget createTestWidget() {
    return ProviderScope(
      overrides: [
        searchUseCaseProvider.overrideWithValue(mockUseCase),
      ],
      child: const MaterialApp(home: SearchScreen()),
    );
  }

  final fakeTask = TaskModel(
    title: 'Fix bug',
    name: 'Bruno Fernandes',
    priority: 'High',
    position: 'Midfielder',
    image: 'assets/images/bruno.png',
    eta: '02-JUL-2025',
    status: 'To Do',
    description: 'Test Description'
  );

  testWidgets('Search filters results and clears correctly', (tester) async {
    when(() => mockUseCase.searchTasks('fix')).thenReturn([fakeTask]);
    when(() => mockUseCase.searchTasks('')).thenReturn([]);

    await tester.pumpWidget(createTestWidget());

    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);

    // Type into the search bar
    await tester.enterText(searchField, 'fix');
    await tester.pumpAndSettle();

    // Should find task card widget
    expect(find.text('Fix bug'), findsOneWidget);
    expect(find.text('Bruno Fernandes'), findsOneWidget);
    expect(find.text('High'), findsOneWidget);

    // Clear the search
    await tester.enterText(searchField, '');
    await tester.pumpAndSettle();

    // Should show "No tasks found"
    expect(find.text('No tasks found'), findsOneWidget);
  });
}