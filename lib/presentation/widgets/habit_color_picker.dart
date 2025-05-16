import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitour/application/notifiers/color_notifier.dart';
import 'package:habitour/core/theme/index.dart';

import 'habit_buttons.dart';

class CustomColorPicker extends ConsumerWidget {
  final ValueChanged<Color> onColorSelected;

  const CustomColorPicker({
    super.key,
    required this.onColorSelected,
  });

  void show(BuildContext context, WidgetRef ref) {
    final colorNotifier = ref.read(colorNotifierProvider.notifier);
    final selectedColor = ref.read(colorNotifierProvider);

    final themeColors = Theme.of(context).brightness == Brightness.light
        ? [
            AppColors.primarySeedLight,
            AppColors.secondarySeedLight,
            AppColors.accentSeedLight,
            AppColors.highlightLight,
            AppColors.bgLight,
            AppColors.errorLight,
          ]
        : [
            AppColors.primarySeedDark,
            AppColors.secondarySeedDark,
            AppColors.accentSeedDark,
            AppColors.highlightDark,
            AppColors.bgDark,
            AppColors.surfaceDark,
            AppColors.errorDark,
          ];

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.9),
                Colors.grey.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select Color',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      HabitIconButton(
                        icon: Icons.close,
                        onPressed: () => Navigator.of(context).pop(),
                        size: 32,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    padding: const EdgeInsets.all(20.0),
                    itemCount: themeColors.length,
                    itemBuilder: (context, index) {
                      final color = themeColors[index];
                      final isSelected = color == selectedColor;
                      return GestureDetector(
                        onTap: () {
                          colorNotifier.selectColor(color);
                          Navigator.of(context).pop();
                          onColorSelected(color);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: themeColors[index],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(4, 4),
                              ),
                            ],
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black.withOpacity(0.4)
                                  : Colors.black.withOpacity(0.2),
                              width: isSelected ? 4 : 1,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(colorNotifierProvider);
    return GestureDetector(
      onTap: () => show(context, ref),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            if (selectedColor != null)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: selectedColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2),
                ),
              )
            else
              const Icon(Icons.color_lens, color: Colors.green),
            const SizedBox(width: 8),
            if (selectedColor == null)
              const Text('Color', style: TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
