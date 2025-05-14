import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitour/core/models/icon_enum.dart';
import 'package:habitour/application/notifiers/icon_notifier.dart';
import 'package:habitour/presentation/widgets/custom_button_widget.dart';

class CustomIconPicker extends ConsumerWidget {
  final ValueChanged<HabitIcon> onIconSelected;

  const CustomIconPicker({
    super.key,
    required this.onIconSelected,
  });

  void show(BuildContext context, WidgetRef ref) {
    final iconNotifier = ref.read(iconNotifierProvider.notifier);
    final selectedIcon = ref.read(iconNotifierProvider);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
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
                          'Select Icon',
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      ),
                      padding: const EdgeInsets.all(12.0),
                      itemCount: HabitIcon.values.length,
                      itemBuilder: (context, index) {
                        final icon = HabitIcon.values[index];
                        final isSelected = icon == selectedIcon;

                        return GestureDetector(
                          onTap: () {
                            iconNotifier.selectIcon(icon);
                            Navigator.of(context).pop();
                            onIconSelected(icon);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                              border: Border.all(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.black.withOpacity(0.2),
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              icon.iconData,
                              size: 32.0,
                              color: isSelected
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.primary,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIcon = ref.watch(iconNotifierProvider);

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
            if (selectedIcon != null)
              Icon(
                selectedIcon.iconData,
                color: Colors.blue,
                size: 32,
              )
            else
              const Icon(Icons.restaurant, color: Colors.blue),
            const SizedBox(width: 8),
            if (selectedIcon == null)
              const Text('Icon', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
