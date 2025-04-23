import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendarWidget extends StatelessWidget {
  const HorizontalCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime(2025, 4, 23);
    final DateTime lastDayOfMonth = DateTime(today.year, today.month + 1, 0);

    final DateTime startFromMonday = today.subtract(
      Duration(days: today.weekday - DateTime.monday),
    );

    final List<DateTime> weekDates = List.generate(
      lastDayOfMonth.difference(startFromMonday).inDays + 1,
      (index) => startFromMonday.add(Duration(days: index)),
    );

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekDates.length,
        itemBuilder: (context, index) {
          final date = weekDates[index];
          final isSelected = date.day == today.day;
          final isPast = date.isBefore(today);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : isPast
                            ? Theme.of(context)
                                .colorScheme
                                .inversePrimary
                                .withOpacity(0.4)
                            : Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        date.day.toString(),
                        style: TextStyle(
                          color: !isSelected || isPast
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat('EEE').format(date),
                        style: TextStyle(
                          color: !isSelected || isPast
                              ? Colors.black
                              : Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
