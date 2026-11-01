import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/key_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final savedKey = prefs.getString('access_key');
  runApp(LinoxApp(initialKey: savedKey));
}

class LinoxApp extends StatelessWidget {
  final String? initialKey;
  const LinoxApp({super.key, this.initialKey});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linox X Cheat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A14),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE31A1A),
          secondary: Color(0xFFFF3333),
        ),
      ),
      home: initialKey != null ? const HomeScreen() : const KeyScreen(),
    );
  }
}
