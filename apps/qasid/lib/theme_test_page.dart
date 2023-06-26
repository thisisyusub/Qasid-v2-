import 'package:app_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qasid/presentation/app.dart';

class ThemeTestPage extends ConsumerWidget {
  const ThemeTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Theme Test Page',
                  style: context.typography.sp10.copyWith(
                    color: context.colors.onBackground,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            CupertinoSwitch(
              value: themeMode == ThemeMode.dark,
              onChanged: (_) {
                ref.read(appThemeProvider.notifier).toggle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
