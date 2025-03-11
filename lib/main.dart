import 'package:flutter/material.dart';
import 'photo_picker.dart';
import 'theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  void initState() {
    super.initState();
    _themeProvider.loadThemePreference();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData(
            brightness: _themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
          ),
          home: HomeScreen(themeProvider: _themeProvider),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ThemeProvider themeProvider;

  HomeScreen({required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CIT 238 Unit 4 Assignment')),
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhotoPicker(),
            SizedBox(height: 20),
            SwitchListTile(
              title: Text('Dark Mode'),
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}