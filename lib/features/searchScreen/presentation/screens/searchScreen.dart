import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq_assignment/core/widgets/card.dart';
import 'package:redoq_assignment/features/searchScreen/presentation/provider/searchProvider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pushNamed('home'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: TextField(
          onChanged: (value) =>
              ref.read(searchProvider.notifier).updateQuery(value),
          decoration: const InputDecoration(
            hintText: 'Search by task, assignee or priority',
            hintStyle: TextStyle(fontSize: 12),
            prefixIcon: Icon(Icons.search),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      body: searchResults.results.isEmpty
          ? const Center(child: Text('No tasks found'))
          : ListView.builder(
              itemCount: searchResults.results.length,
              itemBuilder: (context, index) {
                final task = searchResults.results[index];
                return CardWidget(taskModel: task);
              },
            ),
    );
  }
}
