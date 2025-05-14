import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitour/application/notifiers/icon_notifier.dart';
import 'package:habitour/presentation/widgets/custom_bottom_dialog.dart';

class AddHabitDialog {
  static void show(BuildContext context, {required Function(String) onSave}) {
    final TextEditingController habitNameController = TextEditingController();
    final container = ProviderScope.containerOf(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return CustomBottomDialog(
          buttonText: 'Save',
          onClose: () {
            container.read(iconNotifierProvider.notifier).selectIcon(null);
            Navigator.of(context).pop();
          },
          onButtonPressed: () {},
          textController: habitNameController,
        );
      },
    ).whenComplete(() {
      container.read(iconNotifierProvider.notifier).selectIcon(null);
    });
  }
}
