import 'package:flutter/material.dart';
import 'app_shell.dart';

void main() => runApp(const DongHwaApp());

class DongHwaApp extends StatelessWidget {
  const DongHwaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DongHwa',
      theme: ThemeData(useMaterial3: true),
      home: const AppShell(),
    );
  }
}
