import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redoq_assignment/core/providers/dependencyInjection.dart';
import 'package:redoq_assignment/features/searchScreen/domain/usecase/searchUseCase.dart';
import 'package:redoq_assignment/features/searchScreen/presentation/states/searchState.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  final SearchTasksUseCase useCase;

  SearchNotifier(this.useCase) : super(SearchState());

  // Handles the queries

  void updateQuery(String query) {
    if (query.trim().isEmpty) {
      state = state.copyWith(query: '', results: []);
    } else {
      final results = useCase.searchTasks(query);
      state = state.copyWith(query: query, results: results);
    }
  }
}

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  final useCase = ref.read(searchUseCaseProvider);
  return SearchNotifier(useCase);
});
