import 'package:flutter/material.dart';
import 'package:habitour/core/theme/index.dart';

import 'custom_button_widget.dart';

class CustomColorPicker extends StatelessWidget {
  final ValueChanged<Color> onColorSelected;

  const CustomColorPicker({
    super.key,
    required this.onColorSelected,
  });

  void show(BuildContext context) {
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
                      CustomIconButton(
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
                      return GestureDetector(
                        onTap: () => onColorSelected(themeColors[index]),
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
                              color: Colors.black.withOpacity(0.2),
                              width: 2,
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => show(context),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.color_lens, color: Colors.green),
            SizedBox(width: 8),
            Text('Color', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
