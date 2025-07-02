import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:redoq_assignment/features/homeScreen/presentation/provider/dateProvider.dart';

class DatePickerWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);

    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          final formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
          ref.read(dateProvider.notifier).state = formattedDate;
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Pick a Date',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        child: Text(
          selectedDate ?? 'No date selected',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
