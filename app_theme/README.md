To use this package as your theme, firstly, you should define InheritedWidget as following:

```dart
    return AppThemeProvider(
      appTheme: AppTheme(
        colors: AppColorsData.light(),
        typography: AppTypographyData.regular(),
      ),
      child: const MaterialApp(
        title: 'Qasid (v2)',
        home: Scaffold(),
      ),
    );
  }
```

Then you can use different components of your theme:

```dart
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Test Page',
          style: context.typography.sp10.w700.copyWith(
            color: context.colors.primary,
          ),
        ),
      ),
    );
  }
}
```

