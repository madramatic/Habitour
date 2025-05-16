import 'package:flutter/material.dart';
import 'package:habitour/presentation/widgets/add_habit_dialog.dart';
import 'package:intl/intl.dart';
import 'package:habitour/presentation/widgets/horizontal_calendar_widget.dart';
import '../widgets/habit_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final String todayDate =
        DateFormat('d MMMM yyyy').format(DateTime(2025, 4, 23));

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      todayDate,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                    ),
                    Image.asset(
                      'assets/images/checklist_left.png',
                      height: 100.0,
                    ),
                  ],
                ),
                const HorizontalCalendarWidget(),
              ],
            ),
          ),
          Positioned(
            bottom: 40.0,
            left: 40.0,
            right: 40.0,
            child: SecondaryButton(
              label: "New habit, who this?",
              onPressed: () {
                AddHabitDialog.show(
                  context,
                  onSave: (habitName) {},
                );
              },
              icon: Icons.my_library_add_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
