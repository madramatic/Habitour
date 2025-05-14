import 'package:flutter/material.dart';
import 'package:habitour/presentation/widgets/custom_button_widget.dart';

import 'custom_color_picker.dart';
import 'custom_icon_picker.dart';

class CustomBottomDialog extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClose;
  final VoidCallback onButtonPressed;
  final TextEditingController textController;

  const CustomBottomDialog({
    super.key,
    required this.buttonText,
    required this.onClose,
    required this.onButtonPressed,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.5 / 3,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomIconPicker(onIconSelected: (icon) {}),
                      const SizedBox(width: 16),
                      CustomColorPicker(onColorSelected: (color) {}),
                    ],
                  ),
                  CustomIconButton(
                    icon: Icons.close,
                    onPressed: onClose,
                    size: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Habit name',
                  hintStyle: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SecondaryButton(
                label: buttonText,
                onPressed: onButtonPressed,
                width: 280,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
