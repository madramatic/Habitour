import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitour/presentation/widgets/custom_button_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "Hi, I’m Jeremy.",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: theme.colorScheme.surface,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                " I track habits and\n judge silently.",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: theme.colorScheme.surface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/zen.png'),
                  width: 320,
                  height: 320,
                  semanticLabel: "Jeremy the cat",
                ),
              ),
              const SizedBox(height: 80),
              CustomButton(
                label: "Purrhaps, let's go?",
                onPressed: () {
                  context.go('/home');
                },
              ),
              const SizedBox(height: 60),
              Text(
                "Habitour",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
